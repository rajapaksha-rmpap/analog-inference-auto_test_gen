# all the scripts used to perform tests on the test cases and their sim and spec json files are included here. 

import os
import json
import copy
import time # for testing time usage 
from json_handling import get_a_file_list, traverse_spec 

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
    if (type(value) == dict):
        # if value is a dict, then do not gather values of those specs
        existing_data[spec][dtype]["values"] = "not recorded due to being complicated to represent"
    
    elif (type(value) == list):
        # the value is a list
        if len(value) == 0:
            # if the list is empty 
            if "[]" not in existing_data[spec][dtype]["values"].keys():
                existing_data[spec][dtype]["values"]["[]"] = 0
            existing_data[spec][dtype]["values"]["[]"] += 1
        elif type(value[0]) == dict:
            # ASSUMPTION here is that all the elements in an array would have the same data type
            if "array of dicts" not in existing_data[spec][dtype]["values"].keys():
                existing_data[spec][dtype]["values"]["array of dicts"] = 0
            existing_data[spec][dtype]["values"]["array of dicts"] += 1
        else:
            # there is a non-empty list whose elements are not dict types, thus must be either int, float, str, or else another list
            if str(value) not in existing_data[spec][dtype]["values"].keys():
                existing_data[spec][dtype]["values"][str(value)] = 0
            existing_data[spec][dtype]["values"][str(value)] += 1
    
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
ref_path = "../sw_be/desgen/hwtests/ref/"
testings_in = "testings_in/"
testings_out = "testings_out/"

# getting a list of all the input SPEC files in "../desgen/hwtests/in" dir
in_spec_list = get_a_file_list(in_path, trailor="-spec.json", name_only=True)
in_spec_list.sort()
# getting a list of all the input SIM files in "../desgen/hwtests/in" dir
in_sim_list = get_a_file_list(in_path, trailor="-sim.json", name_only=True)
in_sim_list.sort()
# getting a list of all the reference RPT files in "../desgen/hwtests/ref" dir
ref_rpt_list = get_a_file_list(ref_path, trailor=".rpt", name_only=True)
ref_rpt_list.sort()

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
# with open("testings_out/layers_categorized.json") as layers_cat_file:
#     layer_cat = json.load(layers_cat_file)

# for layer_type in layer_cat.keys():
#     defaults = copy.deepcopy({})
#     for layer in layer_cat[layer_type]:
#         try:
#             defaults = traverse_layer(layer, defaults, operation="gather_data", delete=delete)
#         except:
#             print(layer_type, '\n\n', json.dumps(layer, indent=4))
#             print('\n', json.dumps(defaults, indent=4))
#             defaults = traverse_layer(layer, defaults, operation="gather_data", delete=delete)
#             exit(0)
#     layer_types_spec_info_file_name = ("%s-spec-info.json" %(layer_type)) 
#     with open("testings_out/layer_types_specs_info/%s" %layer_types_spec_info_file_name, 'w') as layer_types_spec_info_file:
#         json.dump(defaults, layer_types_spec_info_file, indent=4)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------ categorizing the tests based on their num. of layers --------------------------------------------------------------------------------
# layer_cnt_space = [0] * 20 # max layer count is 200
# examples = {}
# for test in in_spec_list:
#     try:
#         with open(in_path + test + "-spec.json") as test_file:
#             test_json = json.load(test_file)
#     except:
#         print("%s has an errorneous json spec file!!!" %(in_path + test))
#         continue
#     if "chips" in test_json.keys():
#         layer_cnt = sum([len(chip["io_module"]["layers"]) + sum([len(mac_row["layers"]) for mac_row in chip["mac_rows"]]) for chip in test_json["chips"]])
#     elif "io_module" in test_json.keys():
#         layer_cnt = len(test_json["io_module"]["layers"]) + sum([len(mac_row["layers"]) for mac_row in test_json["mac_rows"]])
#     else:
#         layer_cnt = sum([len(mac_row["layers"]) for mac_row in test_json["mac_rows"]])
#     layer_cnt_sz = layer_cnt // 10
#     layer_cnt_space[layer_cnt_sz] += 1
#     if layer_cnt_sz not in examples.keys():
#         examples[layer_cnt_sz] = []
#     examples[layer_cnt_sz].append(test)
# print(layer_cnt_space)

# with open("testings_out/layers_cat_on_layer_cnt.json", 'w') as layers_cat_on_layer_cnt_file:
#     json.dump(examples, layers_cat_on_layer_cnt_file, indent=4)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------ creating a new easy to search testdb.json file --------------------------------------------------------------------------------------
# cwd = os.getcwd()
# old_testdb = cwd + '/../sw_be/desgen/hwtests/testdb.json'
# with open(old_testdb) as old_tb_file:
#     old_tb = json.load(old_tb_file)
# tests = old_tb["tests"]
# new_tb = {}
# for test in tests:
#     new_tb[test["name"]] = test
# with open("testdb.json", 'w') as new_tb_file:
#     json.dump(new_tb, new_tb_file, indent=4)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------- finding the tests whose sim json file contains a 'num_auto_images' spec ---------------------------------------------------------------------
# sim_nati_arr = []
# for sim_file in in_sim_list:
#     try:
#         with open(in_path + sim_file + "-sim.json") as test_file:
#             sim_json = json.load(test_file)
#     except:
#         print("%s has an errorneous json spec file!!!" %(in_path + sim_file))
#         continue
#     if "num_auto_images" in sim_json.keys() and sim_json["num_auto_images"] > 1:
#         sim_nati_arr.append(sim_file)
# print("sim files with num_auto_images greater than 1: " + ', '.join(sim_nati_arr) + '\n')

# # ****** now let's check out of those with 'num_auto_images', who have .rpt and .txt files 
# sim_nati_with_rpt = set(sim_nati_arr) & set(ref_rpt_list)
# print(f"{tab} who have .rpt files: " + '')
# ***************************** not completed yet ******************************** 
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# ------------------------------------------------------------ finding common and specific specs for layers types ----------------------------------------------------------------------------------
with open("testings_out/layer_types-specs.json") as layer_types_specs_file:
    layer_types_specs = json.load(layer_types_specs_file)

common_specs = set(layer_types_specs["input"])
for layer_type in layer_types_specs:
    common_specs &= set(layer_types_specs[layer_type])

common_specs_arr = list(common_specs)
common_specs_arr.sort()
specific_specs = {"common_specs": common_specs_arr}

for layer_type in layer_types_specs:
    specific_specs_arr = list(set(layer_types_specs[layer_type]) - common_specs)
    specific_specs_arr.sort()
    specific_specs[layer_type] = specific_specs_arr

with open("testings_out/layer_types-specs-commonspecific.json", 'w') as layer_types_specs_file_:
    json.dump(specific_specs, layer_types_specs_file_, indent=4)
# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

end_time = time.time()
print("time usage =", end_time-start_time)
