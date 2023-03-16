#!/usr/bin/python
# Copyright (c) 2021, Analog Inference, Inc.

import os
import sys
import shutil
import json
import argparse

#SHS
proj_path = os.getenv('SW')
home_dir = os.getcwd()

if proj_path != None:
    desgen_path = proj_path + "/desgen/hwtests"
    home_dir = desgen_path

in_dir = home_dir + "/in/"

def mismatch_check(test_name):
    sim_json_file = in_dir + test_name + "-sim.json"
    spec_json_file = in_dir + test_name + "-spec.json"

    try:
        with open(sim_json_file) as simf:
            simjson = json.load(simf)
    except IOError:
        print(test_name + " files not found!")

    fsim = open("fsim.txt", "x")
    fsim.write(" Fsim Failure Report \n===================== \n \n")

    shutil.rmtree(home_dir + "/ASM_test/" + test_name + "/layer_outputs", True, None)
    os.mkdir(home_dir + "/ASM_test/" + test_name + "/layer_outputs")
    os.chdir(home_dir + "/ASM_test/" + test_name + "/layer_outputs")
    
    with open(spec_json_file) as specf:
        specjson = json.load(specf)

    if "weights" in simjson:
        if "weights_dir" in simjson["weights"]:
            weight_dir = simjson["weights"]["weights_dir"]

    # generating a chip list similar to mchip chip list in spec file even for normal test cases
    if 'chips' in specjson:
        chip_list = specjson['chips']
    elif 'chip_id' in specjson:
        chip_list = list()
        chip_list.append(specjson)
    else:
        chip_list = list()
        chip_list.append(specjson)
    
    src_layers = {}
    match_dict = {}
    out_layer_ids = []

    for chip in chip_list:

        io_mod = chip ["io_module"]
        mac_rows = chip["mac_rows"]
        chip_id = 0

        if 'chip_id' in chip:
            chip_id = chip["chip_id"]
        else:
            chip_id = 0    

        io_layers = io_mod["layers"]

        for io_id, io_layer in enumerate(io_layers): 
            layer_id = io_layer["layer_id"]
            if io_layer["layer_type"] == "output" or io_layer["layer_type"] == "output_ext":
                out_layer_ids.append(layer_id)
            
            if io_layer["layer_type"] == "gap":
                fsim.write("layer_id " + str(layer_id) + " :No Intermediate reference files to compare \n")
                match_dict[layer_id] = "NA" 
                            
            if "dest_entries" in io_layer:
                for dest_entry in io_layer["dest_entries"]:
                    for dest_detail in dest_entry["dest_details"]:
                        if "mem_type" in dest_detail:
                            mem_type = dest_detail["mem_type"]
                        if mem_type == "layer_mem":
                            if "dest_layer" in dest_detail:
                                dest_layer = dest_detail["dest_layer"]
                                if dest_layer in src_layers:
                                    srclist = src_layers.get(dest_layer)
                                    srclist.append(layer_id)
                                else:
                                    srclist = [layer_id]
                                    src_layers [dest_layer] = srclist

        for mac_row in mac_rows:
            mac_row_id = mac_row["mac_row_id"]
            layers = mac_row["layers"]

            for sub_layer_id, layer in enumerate(layers):
                layer_id = layer["layer_id"]

                if "dest_entries" in layer:
                    for dest_entry in layer["dest_entries"]:
                        for dest_detail in dest_entry["dest_details"]:
                            if "mem_type" in dest_detail:
                                mem_type = dest_detail["mem_type"]
                            if mem_type == "layer_mem":
                                if "dest_layer" in dest_detail:
                                    dest_layer = dest_detail["dest_layer"]
                                    if dest_layer in src_layers:
                                        srclist = src_layers.get(dest_layer)
                                        srclist.append(layer_id)
                                    else:
                                        srclist = [layer_id]
                                        src_layers [dest_layer] = srclist

                # extract data and rearraging for each layer
                get_id = (int(mac_row_id)+1)*100+int(sub_layer_id)
                grep_cmd = "grep -a -e \"Transfer to result ID " + str(get_id) + " \" " + "../" + test_name + ".log > o_" + str(layer_id) + ".txt"
                sed_cmd1 = r"sed -i 's/Chip.*  //g' o_" + str(layer_id) + ".txt"
                sed_cmd2 = r"sed -i 's/ /\n/g' o_" + str(layer_id) + ".txt"

                os.system(grep_cmd)        
                os.system(sed_cmd1)
                os.system(sed_cmd2)

                layer_type = layer["layer_type"]
                

                if "weights" in simjson:
                    weight_dir = simjson["weights"]["weights_dir"]
                    qmodel_out_dir = (weight_dir.replace("../../","")).replace("weight_bias","outputs")

                    if "wgts_file" not in layer:
                        fsim.write("layer_id " + str(layer_id) +" :Not enough data in spec to find the reference file \n")
                        match_dict[layer_id] = "NA"

                    else:
                        wgts_file = layer["wgts_file"]
                        qmodel_id = (wgts_file.replace("w_","")).replace(".txt","")
                        cmp_cmd_6 = "diff -I Layer.* ../../../" + qmodel_out_dir + "/o_" + qmodel_id + ".txt "+ "o_" + str(layer_id) + ".txt > " + str(layer_id) + "_diff.txt " 

                        if layer_type == "argmax":
                            with open("o_" + str(layer_id) + ".txt", "r") as file:
                                arg_list = file.readlines()
                                arg_list = [val.strip() for val in arg_list]
                                arg_ans = 0
                                for i in range(len(arg_list)):
                                    val = (int(arg_list[i])&0xff) << 8*i
                                    arg_ans += val
                                cmp_argmax = "diff -I Layer.* ../../../" + qmodel_out_dir + "/o_" + qmodel_id + ".txt "+ str(arg_ans) + " " + str(layer_id) + "_diff.txt " 
                            
                        elif layer_type == "concat":
                            fsim.write(cmp_cmd_6)
                            res6 = os.system(cmp_cmd_6)
                            if res6 == 0:
                                fsim.write("layer_id " + str(layer_id) + " :Data Matching\n")
                                os.system("rm o_"+ str(layer_id) + ".txt" )
                                match_dict[layer_id] = "P"
                            else:
                                fsim.write("layer_id " + str(layer_id) + " :Data Mismatching \n")
                                fsim.write("layer_id " + str(layer_id) + " :Mismatch may happen because of out of order concatanation \n")
                                match_dict[layer_id] = "F"

                        else:
                            fsim.write(cmp_cmd_6)
                            res6 = os.system(cmp_cmd_6)
                            if res6 == 0:
                                fsim.write("layer_id " + str(layer_id) + " :Data Matching \n")
                                os.system("rm o_"+ str(layer_id) + ".txt" )
                                match_dict[layer_id] = "P"
                            else:
                                fsim.write("layer_id " + str(layer_id) + " :Data Mismatching \n")
                                match_dict[layer_id] = "F"
                else:
                    fsim.write("layer_id " + str(layer_id) + " :No Intermediate reference files to compare \n")
                    match_dict[layer_id] = "NA"
    #print(src_layers)
    #print(match_dict)
    #print(out_layer_ids) 

    for out_l in out_layer_ids:
        next_check = src_layers[out_l]
        nc = next_check[0]
        for m_l in match_dict:
            if match_dict[nc] == 'NA' or match_dict[nc] == 'F':
                temp = nc
                next_check = src_layers[temp]
                nc = next_check[0]
            else:
                print("Design data matching upto layer_id " + str(nc))
                break
    print("Intermediary layer outputs can be found in " + home_dir + "/ASM_test/" + test_name + "/layer_outputs")
   
    os.system("rm *diff.txt")


