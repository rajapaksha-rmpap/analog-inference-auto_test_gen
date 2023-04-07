# create the 'default.json' file 

import json
import copy
import time

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
# specs who have no default values 
delete = ["num_in_rows", "num_in_cols", "num_in_filters", "num_out_rows", "num_out_cols", "num_out_filters", \
          "layer_id", "layer_mems/lm_max_rows", "layer_mems/lm_row_size", \
          "dest_entries/dest_details/addr_incr", "dest_entries/dest_details/dest_layer", "dest_entries/len", \
          "src_entries/src_index", "src_entries/src_layer", "src_entries/src_addr_incr", "src_entries/src_len", "src_entries/dst_layer"]
# specs who may be optional (not specified always), but have to be added into the output spec json file
essentials = ["src_entries/dst_index", "src_entries/dst_mem_type", "src_entries/src_addr", "src_entries/src_mem_type"]

def gather_data(spec, value, layer_type, existing_data, delete):
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
    if (spec in delete): 
        # if user specify not to consider a spec
        value = "well_defined"
    
    elif (type(value) == dict):
        # if value is a dict, then do not gather values of those specs
        value = "a_json-object"
    
    elif (type(value) == list):
        # the value is a list
        if len(value) == 0:
            # if the list is empty 
            value = "[]"
        elif type(value[0]) == dict:
            # ASSUMPTION here is that all the elements in an array would have the same data type
            value = "object_array"
        else:
            # there is a non-empty list whose elements are not dict types, thus must be either int, float, str, or else another list
            value = str(value)
    
    # for all of the above situations and otherwise, gather what are the values used for that spec and the number of times each of those values appear
    if value not in existing_data[spec][dtype]["values"].keys():
        existing_data[spec][dtype]["values"][value] = 0
    existing_data[spec][dtype]["values"][value] = existing_data[spec][dtype]["values"][value] + 1

# def traverse_layer(layer, default={}, operation="gather_data", root="", keep=None, add=None, rename=None, delete=[], only_del_from_default=False):
#     "traverse a layer specs json strcuture and simplify the object"
#     # layer -> json object representing a layer that was taken from the loaded json spec object
#     # defaults -> json object containing the default parameters for the corresponding layer type
#     # operaton -> "gather_data" -> gather data about the layer specs and add them to the default, return default
#     #          -> "specname_only" -> add the spec name to the default array, return default (here, default is an array, NOT a dict object)
#     #          -> "reduce_layer" -> remove the specs in a layer whose spec values are "well-defined" or same as the defaults
#     # delete -> delete the specs from the layer or does not consider in manipulating/creating the default 
#     # delete -> only_del_from_default -> if True, the specs in delete arr will be kept in layer object, but not be included in default object

#     if type(layer) == dict: 
#         for key in layer.keys():
#             # ***** deleting existing parameters, so they would not appear in 'layer' or 'default' *****
#             # for spec in delete:
#             #     if key == spec:
#             #         if not only_del_from_default: del layer[key] 
#             #         continue

#             if operation == "gather_data": 
#                 if (root + key) not in default.keys():
#                     default[root + key] = copy.deepcopy(data_template)
#                 # extracting the information of each spec and its value
#                 gather_data(root+key, layer[key], default, delete)

#             if operation == "specname_only":
#                 # add the spec name to the default ARRAY 
#                 if (root + key) not in default: default.append(root + key)

#             if operation == "reduce_layer":
#                 # remove the specs in a layer whose spec values are "well-defined" or same as the defaults 
#                 if layer[key] == default[root + key] or default[root + key] == "well_defined": 
#                     del layer[key]                    

#             if type(layer[key]) == dict: 
#                 # if the value is a json object 
#                 traverse_layer(layer[key], default, operation=operation, root=root+key+'/', delete=delete)
#             elif type(layer[key]) == list:
#                 # if the value is a json array 
#                 for entry in layer[key]:
#                     traverse_layer(entry, default, operation=operation, root=root+key+'/', delete=delete)
#             else: # if the entry corresponds to a usual json key-value pair
#                 pass
#     elif type(layer) == list: 
#         for entry in layer: 
#             traverse_layer(entry, default, operation=operation, root=root, delete=delete)     
#     else: pass
#     if operation in ("gather_data", "specname_only"): 
#         return default

def traverse_layer(layer, layer_type, default={}, operation="gather_data", root="", delete=[]):
    "traverse a layer specs json strcuture and simplify the object"
    # layer      -> json object representing a layer in a test spec json file or a lower json level within a layer 
    # layer_type -> type of the layer 
    # default    -> json object containing the default parameters for the corresponding layer type
    # operaton   -> "gather_data" -> gather data about the layer specs and add them to the default, return default 
    #            -> "specname_only" -> add the spec name to the default array, return default (here, default is an array, NOT a dict object)
    #            -> "reduce_layer" -> remove the specs in a layer whose spec values are "well-defined" or equal to its default value
    # root       -> json hierarchy level of the current 'layer' object; root can take values like '', 'dest_entries', 'dest_entries/dest_details', etc. 
    # delete     -> delete the specs from the layer when 'reduce layer' operation is called, and take the value 'well_defined' in creating default specs with 'gather data' operation
    
    if type(layer) == dict: 
        # get a copy of 'layer.keys()', otherwise Exception arises when the specs get deleted when 'operation' == 'reduce_layer' 
        keys = list(layer.keys())
        for key in keys:
            # ***** deleting existing parameters, so they would not appear in 'layer' or 'default' *****
            # for spec in delete:
            #     if key == spec:
            #         if not only_del_from_default: del layer[key] 
            #         continue

            if operation == "gather_data": 
                if (root + key) not in default.keys():
                    default[root + key] = copy.deepcopy(data_template)
                # extracting the information of each spec and its value
                gather_data(root+key, layer[key], layer_type, default, delete)

            if operation == "specname_only":
                # add the spec name to the default ARRAY 
                if (root + key) not in default: default.append(root + key)

            if operation == "reduce_layer":
                # remove the specs in a layer whose spec values are "well-defined" or same as the defaults 
                if key in ("layer_type", "layer_id", "addr", "dest_layer", "lm_max_rows", "addr_incr", "len", \
                "dst_index", "dst_layer", "dst_mem_type", "src_addr", "src_addr_incr", "src_index", "src_layer", "src_len", "src_mem_type"): 
                    continue # these specs must be included in a reduced layer 
                if key == "num_blocks" and layer_type == "conv": 
                    del layer[key]
                    continue
                if default[root + key][0] == "well_defined" or layer[key] == default[root + key][0]: 
                    del layer[key]
                    continue 
                # if root in ("layer_mems", "col_splits"): del root <- this is not complete 

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

def summarize_data(spec, spec_data, num_layers, essential_spec_thres=0.95, optional=True):
    "for a given spec, summarize the data gathered using 'gather_data' function"
    max_count = 0
    for type in spec_data["type"]:
        for value in spec_data[type]["values"]:
            if spec_data[type]["values"][value] > max_count:
                default = value; dtype = type
                max_count = spec_data[type]["values"][value]
    # ------------- arrays with int, float, and str data type elements and empty arrays have been recorded as strings in defaults.json -------------
    # comment the following to get a simplified version of default.json (lists as strings)
    if dtype == "list" and default != "object_array":
        default = eval(default)
    # evaluating the opionality of a spec
    if spec_data["times"] >= num_layers * essential_spec_thres:
        optionality = "essential"
    elif spec in essentials: # 'essentials' has not been specified as an argument to this function 
        optionality = "essential"
    else: 
        optionality = "optional"
    
    if optional: return default, optionality
    else: return default

start = time.time()

# reading all the layers 
with open("testings_out/layers_categorized.json") as layers_cat_file:
    # in 'layers_categorized.json', there are all the layers available in the test cases in 'in' folder categorized under their appropriate 'layer_type'
    layer_cat = json.load(layers_cat_file)

# gather data for each layer type
defaults = {}
for layer_type in layer_cat.keys():
    layer_defaults = copy.deepcopy({})
    num_layers = len(layer_cat[layer_type])
    for layer in layer_cat[layer_type]:
        try:
            layer_defaults = traverse_layer(layer, layer_type,layer_defaults, operation="gather_data", delete=delete)
        except:
            print(layer_type, '\n\n', json.dumps(layer, indent=4))
            print('\n', json.dumps(layer_defaults, indent=4))
            layer_defaults = traverse_layer(layer, layer_type, layer_defaults, operation="gather_data", delete=delete)
            exit(0)

    # summarize data for each spec to determine the default value
    temp = {}
    for spec in layer_defaults:
        # to remove optionality getting written into defaults.json, set 'optional' = False
        temp[spec] = summarize_data(spec, copy.deepcopy(layer_defaults[spec]), num_layers, optional=True)
    defaults[layer_type] = temp

    layer_defaults["num_layers"] = num_layers
    # ****** to rewrite the layer specs info (for each layer type)
    layer_types_spec_info_file_name = ("%s-spec-info.json" %(layer_type)) 
    with open("testings_out/layer_types_specs_info/%s" %layer_types_spec_info_file_name, 'w') as layer_types_spec_info_file:
        json.dump(layer_defaults, layer_types_spec_info_file, indent=4)

with open("defaults.json", 'w') as defaults_file:
    json.dump(defaults, defaults_file, indent=4)

end = time.time()
print("time elapsed: " + str(end-start))