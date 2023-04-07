# code for reducing a given spec file into the input json format of the auto_test_gen program

import os
import json
import copy
import time # for testing time usage 
from json_handling import get_a_file_list

tab = '\t'
# template for storing data of a layer spec 
data_template = {
    "times": 0, 
    "type": []
    # <class type>: {
    #   times: 0,
    #   values: {value: times_of_apperance}
    # }
}
# specs who have no default values and specs who get removed while converted into input json format (but 'num_out_filters' for conv layer class must not be removed while 'reduce_layer' operation)
delete = ["num_in_rows", "num_in_cols", "num_in_filters", "num_out_rows", "num_out_cols", "num_out_filters", "num_blocks", \
          "layer_id", "layer_mems/lm_max_rows", "layer_mems/lm_row_size", \
          "dest_entries/dest_details/addr_incr", "dest_entries/dest_details/dest_layer", "dest_entries/len", \
          "src_entries/src_index", "src_entries/src_layer", "src_entries/src_addr_incr", "src_entries/src_len", "src_entries/dst_layer"]
# specs who may be optional (not specified always), but have to be added into the output spec json file
essentials = ["src_entries/dst_index", "src_entries/dst_mem_type", "src_entries/src_addr", "src_entries/src_mem_type"]

def traverse_layer(layer, layer_type, default={}, operation="reduce_layer", root="", delete=[]):
    "traverse a layer specs json strcuture and simplify the object"
    # layer      -> json object representing a layer in a test spec json file or a lower json level within a layer 
    # layer_type -> type of the layer 
    # default    -> json object containing the default parameters for the corresponding layer type
    # operaton   -> "gather_data" -> gather data about the layer specs and add them to the default, return default (not specified in this script)
    #            -> "specname_only" -> add the spec name to the default array, return default (here, default is an array, NOT a dict object) (not specified in this script)
    #            -> "reduce_layer" -> remove the specs in a layer whose spec values are "well-defined" or equal to its default value
    # root       -> json hierarchy level of the current 'layer' object; root can take values like '', 'dest_entries', 'dest_entries/dest_details', etc. 
    # delete     -> delete the specs from the layer when 'reduce layer' operation is called, and take the value 'well_defined' in creating default specs with 'gather data' operation
    
    if type(layer) == dict: 
        # get a copy of 'layer.keys()', otherwise Exception arises when the specs get deleted when 'operation' == 'reduce_layer' 
        keys = list(layer.keys())
        for key in keys:
            
            if operation == "reduce_layer":
                # remove the specs in a layer whose spec values are "well-defined" or equal to its default value
                if key in ("layer_type", "layer_id", "dest_layer", "addr", "lm_max_rows"): 
                    # these specs must be included in a reduced layer; 'addr_incr' is removed from each layer
                    continue 
                if key == "len"             and layer[key] == layer["num_out_cols"] * layer["num_out_filters"]:
                    # if 'len' is same as the image row size 
                    del layer[key]
                    continue 
                if key == "num_out_filters" and layer_type in ("conv", "transpose", "dilate"):
                    # for layers of 'conv' layer class, keep 'num_out_filters'
                    continue

                # reduce 'num_blocks', 'num_xbars', and 'nconvs' specs
                if key == "num_blocks": 
                    del layer[key]
                    continue
                if key in ("num_xbars", "nconvs"):
                    if layer_type not in ("conv", "transpose", "dilate"): 
                        del layer[key]
                        continue 
                    layer[key] = layer[key][0]
                
                # remove all the well defined specs and specs whose value is equal to its default value 
                if default[root + key][0] == "well_defined" or layer[key] == default[root + key][0]: 
                    del layer[key]
                    continue 

            if type(layer[key]) == dict: 
                # if the value is a json object 
                traverse_layer(layer[key], layer_type, default, operation=operation, root=root+key+'/', delete=delete)
            elif type(layer[key]) == list:
                # if the value is a json array 
                for entry in layer[key]:
                    traverse_layer(entry, layer_type, default, operation=operation, root=root+key+'/', delete=delete)
            else: # if the entry corresponds to a usual json key-value pair
                pass
    elif type(layer) == list: 
        for entry in layer: 
            traverse_layer(entry, layer_type, default, operation=operation, root=root, delete=delete)     
    else: pass

    if operation in ("gather_data", "specname_only"): 
        return default

def traverse_spec(spec_json, return_arr=False, container=None, key=None):
    "traverse through the spec json structure and return a json object containing all the io module and mac row layers"
    # 'key' -> if not specified, for each layer, its 'layer_id' will be used as the key if the container is a 'dict' type
    #       -> key is specifically useful to store the 'test_name' information of a given layer 
    if container == None: container = [] if return_arr else dict()
    
    if "chips" in spec_json.keys():
        # if the top most layer of the spec json file is chips, 
        for chip in spec_json["chips"]:
            container = traverse_spec(chip, return_arr, container, key)

    if "io_module" in spec_json:
        # if there is an io module in the specified spec json struct or in the chip
        for io_layer in spec_json["io_module"]["layers"]:
            if return_arr: container.append(io_layer)
            else: 
                if key == None: container[io_layer["layer_id"]] = io_layer
                else: container[str((key, io_layer["layer_id"]))] = io_layer

    if "mac_rows" in spec_json:
        for mac_row in spec_json["mac_rows"]:
            for mac_layer in mac_row["layers"]:
                if return_arr: container.append(mac_layer)
                else: 
                    if key == None: container[mac_layer["layer_id"]] = mac_layer
                    else: container[str((key, mac_layer["layer_id"]))] = mac_layer

    return container  

def put_specs_inorder(layer):
    "put the specs in an easy-to-read order"
    layer_copy = copy.deepcopy(layer)
    for key in layer_copy: del layer[key]
    layer["layer_id"] = layer_copy["layer_id"]
    layer["layer_type"] = layer_copy["layer_type"]
    for key in ("col_splits", "grp_shift", "shift", "sign"):
        if key in layer_copy:
            layer[key] = layer_copy[key]; del layer_copy[key]
    for key in ("dest_layer", "dest_entries", "addr", "addr_incr", "dest_addr", "gen_sync", "mem_index", "mem_type", "len"):
        if key in layer_copy:
            layer[key] = layer_copy[key]; del layer_copy[key]
    # otherwise put them in alphabetical order 
    keys = list(layer_copy.keys()); keys.sort()
    for key in keys:
        layer[key] = layer_copy[key]


start_time = time.time()

in_path = "../sw_be/desgen/hwtests/in/"
testings_out = "testings_out/"

# getting a list of all the input SPEC files in "../desgen/hwtests/in" dir
in_spec_list = get_a_file_list(in_path, trailor="-spec.json", name_only=True)
in_spec_list.sort()
# getting a list of all the input SIM files in "../desgen/hwtests/in" dir
in_sim_list = get_a_file_list(in_path, trailor="-sim.json", name_only=True)
in_sim_list.sort()

test_name = "rn50-best"
with open(in_path + test_name + "-spec.json") as test_file:
    test_cnt = json.load(test_file)
with open("defaults.json") as defaults_file:
    defaults = json.load(defaults_file)

layers_arr = traverse_spec(test_cnt, return_arr=True)

for layer in layers_arr:
    traverse_layer(layer, layer["layer_type"], default=defaults[layer["layer_type"]], operation="reduce_layer")
    
    # let's do some further simplifications now
    # -> disolving 'dest_entries'
    for dest_entry in layer["dest_entries"]:
        if len(dest_entry["dest_details"]) == 1:
            for key in dest_entry["dest_details"][0]:
                dest_entry[key] = dest_entry["dest_details"][0][key]
            del dest_entry["dest_details"]

    if len(layer["dest_entries"]) == 1 and "dest_details" not in layer["dest_entries"]:
        for key in layer["dest_entries"][0]:
            layer[key] = layer["dest_entries"][0][key]
        del layer["dest_entries"]

    # -> disolving 'layer_mems'
    if len(layer["layer_mems"]) == 1: 
        for key in layer["layer_mems"][0]:
            layer[key] = layer["layer_mems"][0][key]
        del layer["layer_mems"]

    # -> disolving 'col_splits'
    if "col_splits" in layer and len(layer["col_splits"]["splits"]) == 1:
        for key in layer["col_splits"]["splits"][0]:
            layer["col_splits"][key] = layer["col_splits"]["splits"][0][key]
        del layer["col_splits"]["splits"]

        for key in layer["col_splits"]:
            layer[key] = layer["col_splits"][key]
        del layer["col_splits"]

    # -> disolving 'src_entries'
    if layer["src_entries"] == []:
        del layer["src_entries"]
    elif len(layer["src_entries"]) == 1: 
        for key in layer["src_entries"][0]:
            layer[key] = layer["src_entries"][0][key]
        del layer["src_entries"]
    
    # put the specs in order 
    put_specs_inorder(layer)

with open("auto_tests_in/" + test_name + "-new.json", 'w') as in_file:
    json.dump(test_cnt, in_file, indent=4)
