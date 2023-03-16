# contain functions for creating, accessing, and manipulating json files 

import os 
import json 

def get_a_file_list(path, trailor, name_only=False):
    "returns an array of all the files in the folder specified by the path, whose file names end with the specified trailor"
    items = os.scandir(path)
    file_list = [item.name for item in items if item.is_file and item.name.endswith(trailor)]
    if name_only: return [file_name.strip(trailor) for file_name in file_list] # excluding the trailor
    else: return file_list

def traverse_layer(layer, defaults, keep=None, add=None, rename=None):
    "traverse a layer specs json strcuture and simplify the object"
    # layer -> json object representing a layer that was taken from the loaded json spec object
    # defaults -> json object containing the default parameters for the corresponding layer type

    if type(layer) == dict: 
        for key in layer.keys():
            if type(layer[key]) == dict: 
                # if the value is a json object 
                traverse_layer(layer[key])
            elif type(layer[key]) == list:
                # if the value is a json array 
                for entry in layer[key]:
                    traverse_layer(entry)
            else: # if the entry corresponds to a usual json key-value pair
                if key not in defaults.keys(): 
                    print("parameter %s is not defined in %s " %(key, (os.path.abspath('default.json'))))
                else: 
                    if layer[key] == defaults[key]:
                        del layer[key]
    elif type(layer) == list: 
        for entry in layer: 
            traverse_layer(entry, defaults)     
    else: pass

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
