# ----------------------------------------------------------------

import os
import sys
import json
from argparse import ArgumentParser
from pathlib import Path 
from layer_processes import *
from json_handling import get_a_file_list, fill_in_spec_json

home_in_dir = "auto_tests_in/"
hwtests_in_dir = "../sw_be/desgen/hwtests/in"
out_json_path = "auto_tests_out/"

success = fsim_suc = asmsim_suc = 0 # count of complete successful test runs 

parser = ArgumentParser(prog="auto_test_gen", description="automatically generates sim and spec json files when an input json file is provided and simulate the test")
parser.add_argument("testnames", nargs='*', help="one or more tests (spcified by test name only) as inputs to the automatic test generation")
parser.add_argument('-f', "--fsim", action='store_true', help='when specified, fsim will be run on each of the input tests')
parser.add_argument('-a', "--asmsim", action='store_true', help='when specified, asmsim will be run on each of the input tests')
parser.add_argument('-b', "--both", action='store_true', help='when specified, both fsim and asmsim will be run on each of the input tests')
parser.add_argument('-i', "--input_dir", choices=["home", "hwtests"], default="home", help='indicates the directory from which the input test will be read')
args = parser.parse_args()

# getting a list of all the input tests in the spcified input dir
if args.input_dir == "home":
    in_path = home_in_dir
    in_test_list = get_a_file_list(in_path, trailor=".json", name_only=True)
elif args.input_dir == "hwtests":
    in_path = hwtests_in_dir
    in_test_list = get_a_file_list(in_path, trailor="-spec.json", name_only=True)

if len(args.testnames) == 0: 
    # if no test case is specified, run all the input test casees in input dir
    run_all = input("do you want to run all the tests in %s/ [Y/n] (no. of tests - %d)? :- " %(os.path.abspath(in_path), len(in_test_list)))
    if run_all not in ("y", "Y"): 
        print("Auto Test Generation is exiting!")
        exit(0)
    test_list = in_test_list
else: 
    test_list = args.testnames

print("runnning the tests:", ', '.join(test_list))

for test_name in test_list: 
    if test_name not in in_test_list: 
        print("\nspecified test '%s' does not exist in %s/" %(test_name, os.path.abspath(in_path)))
        continue 
    print("\nrunning file auto creation for %s" %(test_name))

    spec_json_struct = {"io_module": 
                            {
                                "layers":[]
                            }, 
                        "mac_rows": 
                            [
                                {
                                    "mac_row_id": 0, 
                                    "layers": []
                                }
                            ],
                        "residual_mems": []
                        }
    sim_json = {}

    input_json_file = open(in_path + test_name + ".json")
    input_json = json.load(input_json_file)

    default_json_file = open("default.json")
    default_json = json.load(default_json_file)

    layers = dict() 
    layer_IDs = set(); dest_IDs = set()

    # the specs for the sim.json file will always be given at the top of the input json file 
    # reading the input image dimensions 
    num_in_rows = sim_json["num_in_rows"] = input_json["num_in_rows"]
    num_in_cols = sim_json["num_in_cols"] = input_json["num_in_cols"]
    num_in_filters = sim_json["num_in_filters"] = input_json["num_in_filters"]

    # read other sim.json specs if they exist in input json and move it to sim_json 
    for sim_spec in ("use_block_transfer", "read_in_image", "write_out_image", "input_image_file", "output_image_file", "image_fill_method", "out_data_file", "pos_neg_acts", 
                    "max_ticks", "step_ticks", "asm_out_data_file", "asm_results_file", "asm_sim"):
        if sim_spec in input_json.keys():
            sim_json[sim_spec] = input_json[sim_spec]
        else:
            sim_json[sim_spec] = default_json["sim"][sim_spec]
    
    if "chips" in input_json.keys(): 
        # do something 
        input_json = input_json["chips"][0]

    # putting all the IO module and MAC row layers together into a dict 
    # -> when working with different MAC rows and chips, extend the key to a three element tuple 
    # -> ex:- (layer_id, mac_row_id, chip_id) 
    for io_layer in input_json["io_module"]["layers"]: 
        if not io_layer["layer_id"] in layers.keys(): 
            layers[io_layer["layer_id"]] = io_layer
            layer_IDs.add(io_layer["layer_id"])
            dest_IDs.add(io_layer["dest_id"])
        else: 
            print("ERROR - layer ID %d is not a unique identifier." %(io_layer["layer_id"]))
            exit(0)

    for mac_row_layer in input_json["mac_rows"][0]["layers"]: 
        if not mac_row_layer["layer_id"] in layers.keys(): 
            layers[mac_row_layer["layer_id"]] = mac_row_layer
            layer_IDs.add(mac_row_layer["layer_id"])
            dest_IDs.add(mac_row_layer["dest_id"])
        else: 
            print("ERROR - layer ID %d is not a unique identifier." %(mac_row_layer["layer_id"]))
            exit(0)

    # finding the starting layer ID 
    diff = layer_IDs - dest_IDs
    # do evaluate conditions against the count of starting layers 
    starting_layer = list(diff)[0]
    # do evaluate conditions against starting layer if it belongs to IO module 

    # finding the starting filter size (needed to fill in the sim.json) and lm_max_rows (for input and io_bypass layers) 
    filter_sz, lm_max_rows = start_mac_row_layer(layers, starting_layer)
    sim_json["filter_size"] = filter_sz
    current_layer = starting_layer

    while current_layer in layer_IDs: 
        # all tha layers are processed based on their layer type 
        layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows, dest_layer = process_layers(layers[current_layer], num_in_rows, num_in_cols, num_in_filters, lm_max_rows)
        spec_json_struct = fill_in_spec_json(spec_json_struct, layer)
        layer_IDs.remove(current_layer)
        current_layer = dest_layer

    if layer_IDs: 
        # after processing all layers, if there exist any more layers unprocessed, raise a warning or an error
        pass 

    # fill in the output info in sim json 
    sim_json["num_out_rows"] = num_in_rows
    sim_json["num_out_cols"] = num_in_cols
    sim_json["num_out_filters"] = num_in_filters
    sim_json["output_layer"] = layer["layer_id"]

    # saving spec.json and sim.json files 
    spec_file = Path(out_json_path + test_name + "-atg-spec.json")
    sim_file  = Path(out_json_path + test_name + "-atg-sim.json")
    spec_file.touch(exist_ok=True)
    sim_file.touch(exist_ok=True)

    with open(spec_file, 'w') as spec_json_file:
        json.dump(spec_json_struct, spec_json_file, indent=4)
    with open(sim_file, 'w') as sim_json_file:
        json.dump(sim_json, sim_json_file, indent=4)

    print("file auto creation of '%s-spec.json' and '%s-sim.json' was successful" %(test_name, test_name))
    success += 1

print("\n%d out of %d: sim and spec json files auto generation was successful." %(success, len(test_list)))
