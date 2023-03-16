# all the scripts used to perform tests on the test cases and their sim and spec json files are included here. 

import os
import json
import copy
import time # for testing time usage 
from json_handling import get_a_file_list, traverse_spec 

# template for storing data of a layer spec 
data_template = {
    "times": 0, 
    "type": []
    # <class type>: {
    #   times: 0,
    #   values: {value: times_of_apperance}
    # }
}
delete = ["num_in_rows", "num_in_cols", "num_in_filters", "num_out_rows", "num_out_cols", "num_out_filters", \
          "stride", "pad_top", "pad_bot", "pad_left", "pad_right", \
          "layer_id", "layer_mems/lm_max_rows", "layer_mems/lm_row_size", \
          "dest_entries/dest_details/addr_incr", "dest_entries/dest_details/dest_layer", "dest_entries/len"]

def gather_data(spec, value, existing_data):
    "gather data about a spec in a given layer type by combining existing data of the spec with the incoming value"
    # update the number of times the spec has apperaed 
    existing_data[spec]["times"] = existing_data[spec]["times"] + 1

    # gather info about the data type of each spec 
    if type(value) == int: 
        dtype = 'int' 
    elif type(value) == float: 
        dtype = 'float'
    elif type(value) == str: 
        dtype = 'string' 
    elif type(value) == bool: 
        dtype = 'boolean' 
    elif value == None: 
        dtype = 'NoneValue' 
    elif type(value) == list or type(value) == tuple: 
        dtype = 'list'  
    else: 
        dtype = 'dict' 

    if dtype not in existing_data[spec]["type"]: 
        existing_data[spec]["type"].append(dtype)
        existing_data[spec][dtype] = {"times": 0, "values": {}}
    existing_data[spec][dtype]["times"] = existing_data[spec][dtype]["times"] + 1

    # gather data about the value of the spec 
    if (type(value) == dict) or (type(value) == list and len(value) and type(value[0]) == dict):
        # if value is a dict or the value is a list and that list's element are dicts
        # then, do not gather what are the exact values of those specs
        existing_data[spec][dtype]["values"] = "not recorded due to having a complicated value to represent"
    elif (spec in delete): 
        # if user specify not to consider a spec
        existing_data[spec][dtype]["values"] = "not recorded due to being already well defined"
    else: 
        # ohterwise, do gather what are the values used for that spec and the number of times each of those values appear
        if str(value) not in existing_data[spec][dtype]["values"].keys():
            existing_data[spec][dtype]["values"][str(value)] = 0
        existing_data[spec][dtype]["values"][str(value)] = existing_data[spec][dtype]["values"][str(value)] + 1

def traverse_layer(layer, default={}, operation="gather_data", root="", keep=None, add=None, rename=None, delete=[], only_del_from_default=False):
    "traverse a layer specs json strcuture and simplify the object"
    # layer -> json object representing a layer that was taken from the loaded json spec object
    # defaults -> json object containing the default parameters for the corresponding layer type
    # operaton -> "gather_data" -> gather data about the layer specs and add them to the default, return default
    #          -> "specname_only" -> add the spec name to the default array, return default (here, default is an array, NOT a dict object)
    # delete -> delete the specs from the layer or does not consider in manipulating/creating the default 
    # delete -> only_del_from_default -> if True, the specs in delete arr will be kept in layer object, but not be included in default object

    if type(layer) == dict: 
        for key in layer.keys():
            # ***** deleting existing parameters, so they would not appear in 'layer' or 'default' *****
            # for spec in delete:
            #     if key == spec:
            #         if not only_del_from_default: del layer[key] 
            #         continue

            if operation == "gather_data": 
                if (root + key) not in default.keys():
                    default[root + key] = copy.deepcopy(data_template)
                # extracting the information of each spec and its value
                gather_data(root+key, layer[key], default)

            if operation == "specname_only":
                # add the spec name to the default ARRAY 
                if (root + key) not in default: default.append(root + key)

            if type(layer[key]) == dict: 
                # if the value is a json object 
                traverse_layer(layer[key], default, operation=operation, root=root+key+'/')
            elif type(layer[key]) == list:
                # if the value is a json array 
                for entry in layer[key]:
                    traverse_layer(entry, default, operation=operation, root=root+key+'/')
            else: # if the entry corresponds to a usual json key-value pair
                pass
    elif type(layer) == list: 
        for entry in layer: 
            traverse_layer(entry, default, operation=operation, root=root)     
    else: pass
    if operation in ("gather_data", "specname_only"): 
        return default

def testing_function(DICT, count=0):
    "checking whether an existing dict can be mainpulated using a function"
    count += 1
    DICT["new_element"] = count 
    for key in DICT.keys():
        if type(DICT[key]) == dict:
            testing_function(DICT[key], count)

start_time = time.time()

in_path = "../sw_be/desgen/hwtests/in/"
testings_in = "testings_in/"
testings_out = "testings_out/"

# getting a list of all the input SPEC files in "../desgen/hwtests/in" dir
in_spec_list = get_a_file_list(in_path, trailor="-spec.json")
in_spec_list.sort()

# -------------------------------------------------------- creating a list of all the layers specified in the test cases ---------------------------------------------------------------------------
# layers_arr = []
# for test in in_spec_list:
#     try:
#         with open(in_path + test) as test_file:
#             test_json = json.load(test_file)
#     except:
#         print("%s has an errorneous json spec file!!!" %(in_path + test))
#         continue
#     layers_arr = traverse_spec(test_json, return_arr=True, container=layers_arr)

# with open("testings_out/all_layers.json", 'w') as all_layers_file:
#     json.dump(layers_arr, all_layers_file, indent=4)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# -------------------------------------------------- let's create a dict categorizing all the layers based on their layer types --------------------------------------------------------------------
# with open("testings_out/all_layers.json") as all_layers_file:
#     layers_arr = json.load(all_layers_file)

# layer_types = {}
# for layer in layers_arr:
#     if layer["layer_type"] not in layer_types.keys():
#         layer_types[layer["layer_type"]] = []
#     layer_types[layer["layer_type"]].append(layer)

# with open("testings_out/layers_categorized.json", 'w') as layers_cat_file:
#     json.dump(layer_types, layers_cat_file, indent=4)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# --------------------------------------------------------------------- creating the default json structure ----------------------------------------------------------------------------------------
with open("testings_out/layers_categorized.json") as layers_cat_file:
    layer_cat = json.load(layers_cat_file)

# for layer_type in layer_types.keys():
for layer_type in layer_cat.keys():
    defaults = copy.deepcopy({})
    for layer in layer_cat[layer_type]:
        defaults = traverse_layer(layer, defaults, operation="gather_data", delete=delete)

    layer_types_spec_info_file_name = ("%s-spec-info.json" %(layer_type)) 
    with open("testings_out/layer_types_specs_info/%s" %layer_types_spec_info_file_name, 'w') as layer_types_spec_info_file:
        json.dump(defaults, layer_types_spec_info_file, indent=4)


# for layer_type in layer_types.keys():
#     for spec in layer_types[layer_type].keys():
#         # verifying that each spec has only one associate data type 
#         if len(layer_types[layer_type][spec]["type"]) != 1:
#             data_types = str(layer_types[layer_type][spec]["type"])
#             spec = layer_type + "/" + spec
#             tab = '\t'
#             if 16 < len(spec) <= 24: print(f'{spec}{tab}{tab}{tab}{data_types}')
#             elif len(spec) <= 16: print(f'{spec}{tab}{tab}{data_types}') 
#             else: print(f'{spec}{tab}{data_types}')

# ----------------------------------------------------------- creating a json file just with layer types and their specs --------------------------------------------------------------------------
# for layer_type in layer_types.keys():
#     default = []
#     for layer in layer_types[layer_type]:
#         default = traverse_layer(layer, default, operation="specname_only")
#     layer_types[layer_type] = default 

# with open("testings_out/layer_types-specs.json", 'w') as file:
#     json.dump(layer_types, file, indent=4)

# with open("testings_out/defaults.json", 'w') as defaults_file:
#     json.dump(layer_types, defaults_file, indent=4)

# print(json.dumps(layer_types, indent=4))

end_time = time.time()
print("time usage =", end_time-start_time)
