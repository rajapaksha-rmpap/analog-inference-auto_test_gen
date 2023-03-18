# contain functions for creating, accessing, and manipulating json files 

import os 
import json 

def get_a_file_list(path, trailor, name_only=False):
    "returns an array of all the files in the folder specified by the path, whose file names end with the specified trailor"
    items = os.scandir(path)
    file_list = [item.name for item in items if item.is_file and item.name.endswith(trailor)]
    if name_only: return [file_name[:len(file_name)-len(trailor)] for file_name in file_list] # excluding the trailor
    else: return file_list

# def traverse_layer(layer, defaults, keep=None, add=None, rename=None):
#     "traverse a layer specs json strcuture and simplify the object"
#     # layer -> json object representing a layer that was taken from the loaded json spec object
#     # defaults -> json object containing the default parameters for the corresponding layer type

#     if type(layer) == dict: 
#         for key in layer.keys():
#             if type(layer[key]) == dict: 
#                 # if the value is a json object 
#                 traverse_layer(layer[key])
#             elif type(layer[key]) == list:
#                 # if the value is a json array 
#                 for entry in layer[key]:
#                     traverse_layer(entry)
#             else: # if the entry corresponds to a usual json key-value pair
#                 if key not in defaults.keys(): 
#                     print("parameter %s is not defined in %s " %(key, (os.path.abspath('default.json'))))
#                 else: 
#                     if layer[key] == defaults[key]:
#                         del layer[key]
#     elif type(layer) == list: 
#         for entry in layer: 
#             traverse_layer(entry, defaults)     
#     else: pass


# version (1)
# def gather_data(spec, value, existing_data):
#     "gather data about a spec in a given layer type by combining existing data of the spec with the incoming value"
#     # update the number of times the spec has apperaed 
#     existing_data[spec]["times"] = existing_data[spec]["times"] + 1

#     # gather info about the data type of each spec 
#     if type(value) == int: 
#         dtype = 'int' 
#     elif type(value) == float: 
#         dtype = 'float'
#     elif type(value) == str: 
#         dtype = 'string' 
#     elif type(value) == bool: 
#         dtype = 'boolean' 
#     elif value == None: 
#         dtype = 'NoneValue' 
#     elif type(value) == list or type(value) == tuple: 
#         dtype = 'list'  
#     else: 
#         dtype = 'dict' 

#     if dtype not in existing_data[spec]["type"]: 
#         existing_data[spec]["type"].append(dtype)
#         existing_data[spec][dtype] = {"times": 0, "values": {}}
#     existing_data[spec][dtype]["times"] = existing_data[spec][dtype]["times"] + 1

#     # gather data about the value of the spec 
#     if (type(value) == dict) or (type(value) == list and len(value) and type(value[0]) == dict):
#         # if value is a dict or the value is a list and that list's element are dicts
#         # then, do not gather what are the exact values of those specs
#         existing_data[spec][dtype]["values"] = "not recorded due to having a complicated value to represent"
#     elif (spec in delete): 
#         # if user specify not to consider a spec
#         existing_data[spec][dtype]["values"] = "not recorded due to being already well defined"
#     else: 
#         # ohterwise, do gather what are the values used for that spec and the number of times each of those values appear
#         if str(value) not in existing_data[spec][dtype]["values"].keys():
#             existing_data[spec][dtype]["values"][str(value)] = 0
#         existing_data[spec][dtype]["values"][str(value)] = existing_data[spec][dtype]["values"][str(value)] + 1

# version (2)


# version (1)
# def process_dest_entries(layer):
#     "create or validate the 'dest_entries' structure in the layer"

#     if "dest_entries" not in layer:
#         # if 'dest_entries' has not been specified, but a 'dest_id' is in the layer, 
#         # then, create a 'dest_entries' object, and bubble-up dest params into 'dest_entries'
#         if "dest_layer" not in layer:
#             print("layer id: %d - 'dest_layer' has not been specified" %layer["layer_id"])
#             exit(0)
#         elif type(layer["dest_layer"]) != int:
#             # in order to avoid an array being given for dest_ids
#             print("layer id: %d - 'dest_layer' only takes int values" %layer["layer_id"])
#             exit(0)
#         else:
#             layer["dest_entries"] = {}
#             # bubbling-up the dest params if they are specified within the layer 
#             for spec in ["addr", "len", "addr_incr", "dest_addr", "dest_layer", "mem_index", "mem_type", "gen_sync"]:
#                 if spec in layer:
#                     layer["dest_entries"][spec] = layer[spec]
#                     del layer[spec]
    
#     # if 'dest_entries' has been specified verify its structrue and specs 
#     if type(layer["dest_entries"]) == dict:
#         layer["dest_entries"] = [layer["dest_entries"]]
    
#     if not type(layer["dest_entries"]) == list:
#         print("layer id: %d - 'dest_entries' must be an array or a json object (python dict)" %layer["layer_id"])
#         exit(0)

#     if len(layer["dest_entries"]) == 0:
#         print("layer id: %d - 'dest_entries' must be a non-empty array of json objects (python dict)" %layer["layer_id"])
#         exit(0)

#     for dest_entry in layer["dest_entries"]:
#         if not type(dest_entry) == dict:
#             print("layer id: %d - elements of 'dest_entries' must be json objects (python dicts)" %layer["layer_id"])
#             exit(0)
        
#         if "dest_details" not in dest_entry:
#             # if 'dest_details' has not been specified, but a 'dest_id' is in the dest_entry, 
#             # then, create a 'dest_details' object, and bubble-up dest params into 'dest_details'
#             if "dest_layer" not in dest_entry:
#                 print("layer id: %d - 'dest_layer' has not been specified" %layer["layer_id"])
#                 exit(0)
#             elif type(dest_entry["dest_layer"]) != int:
#                 # in order to avoid an array being given for dest_ids
#                 print("layer id: %d - 'dest_layer' only takes int values" %layer["layer_id"])
#                 exit(0)
#             else:
#                 dest_entry["dest_details"] = {}
#                 # bubbling-up the dest params into 'dest_details' if they are specified in the dest_entry 
#                 for spec in ["addr_incr", "dest_addr", "dest_layer", "mem_index", "mem_type", "gen_sync"]:
#                     if spec in dest_entry:
#                         dest_entry["dest_details"][spec] = dest_entry[spec]
#                         del dest_entry[spec]

#         # if 'dest_details' has been specified with in each of the dest_entry, verify dest_details
#         if type(dest_entry["dest_details"]) == dict:
#             dest_entry["dest_details"] = [dest_entry["dest_details"]]
        
#         if not type(dest_entry["dest_details"]) == list:
#             print("layer id: %d - 'dest_details' must be an array or a json object (python dict)" %layer["layer_id"])
#             exit(0)

#         if len(dest_entry["dest_details"]) == 0:
#             print("layer id: %d - 'dest_entries' must be a non-empty array of json objects (python dict)" %layer["layer_id"])
#             exit(0)

#         for dest_details in dest_entry["dest_details"]:
#             if not type(dest_details) == dict:
#                 print("layer id: %d - elements of 'dest_details' must be json objects (python dicts)" %layer["layer_id"])
#                 exit(0)
#             if "layer_id" not in dest_details:
#                 print("layer id: %d - 'dest_layer' has not been specified" %layer["layer_id"])
#                 exit(0)

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


def traverse_spec(spec_json, return_arr=False, container=None):
    "traverse through the spec json structure and return a json object containing all the io module and mac row layers"
    if container == None: container = [] if return_arr else dict()
    
    if "chips" in spec_json.keys():
        # if the top most layer of the spec json file is chips, 
        for chip in spec_json["chips"]:
            container = traverse_spec(chip, return_arr, container)

    if "io_module" in spec_json:
        # if there is an io module in the specified spec json struct or in the chip
        for io_layer in spec_json["io_module"]["layers"]:
            if return_arr: container.append(io_layer)
            else: container[io_layer["layer_id"]] = io_layer

    if "mac_rows" in spec_json:
        for mac_row in spec_json["mac_rows"]:
            for mac_layer in mac_row["layers"]:
                if return_arr: container.append(mac_layer)
                else: container[mac_layer["layer_id"]] = mac_layer

    return container  

def fill_in_spec_json(spec_json, layer):
    # complete the spec.json file by filling in the layers 
    if layer["layer_type"] in ("input", "input_ext", "io_bypass", "output", "output_ext"): 
        spec_json["io_module"]["layers"].append(layer)
    else: 
        spec_json["mac_rows"][0]["layers"].append(layer)
    return spec_json 
