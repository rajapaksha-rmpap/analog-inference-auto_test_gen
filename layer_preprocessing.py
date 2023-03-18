# take layer objects from the input json file and complete them with appropriate default values based on their layer type. 

import copy

def process_dest_entries(layer):
    "create or validate the 'dest_entries' structure in the layer"

    if "dest_entries" not in layer:
        # if 'dest_entries' has not been specified, then, create a 'dest_entries' object, and bubble-up dest params into that
        layer["dest_entries"] = {}
        for spec in ["addr", "len", "addr_incr", "dest_addr", "dest_layer", "mem_index", "mem_type", "gen_sync"]:
            if spec in layer:
                layer["dest_entries"][spec] = layer[spec]
                del layer[spec]
    
    # if 'dest_entries' has been specified verify its structrue and specs 
    if type(layer["dest_entries"]) == dict:
        layer["dest_entries"] = [layer["dest_entries"]]

    if not type(layer["dest_entries"]) == list or len(layer["dest_entries"]) == 0:
        print("layer id: %d - 'dest_entries' must be either a single json object or a non-empty array of json objects" %layer["layer_id"])
        exit(0)

    for dest_entry in layer["dest_entries"]:
        if not type(dest_entry) == dict:
            print("layer id: %d - elements of 'dest_entries' must be json objects (python dicts)" %layer["layer_id"])
            exit(0)
        
        if "dest_details" not in dest_entry:
            # if 'dest_details' has not been specified, then, create a 'dest_details' object, and bubble-up dest params into it
            dest_entry["dest_details"] = {}
            for spec in ["addr_incr", "dest_addr", "dest_layer", "mem_index", "mem_type", "gen_sync"]:
                if spec in dest_entry:
                    dest_entry["dest_details"][spec] = dest_entry[spec]
                    del dest_entry[spec]

        # if 'dest_details' has been specified with in each of the dest_entry, verify 'dest_details'
        if type(dest_entry["dest_details"]) == dict:
            dest_entry["dest_details"] = [dest_entry["dest_details"]]
        
        if not type(dest_entry["dest_details"]) == list or len(dest_entry["dest_details"]) == 0:
            print("layer id: %d - 'dest_details' must be either a single json object or a non-empty array of json objects" %layer["layer_id"])
            exit(0)

        for dest_details in dest_entry["dest_details"]:
            if not type(dest_details) == dict:
                print("layer id: %d - elements of 'dest_details' must be json objects (python dicts)" %layer["layer_id"])
                exit(0)
            if "dest_layer" not in dest_details:
                print("layer id: %d - 'dest_layer' has not been specified" %layer["layer_id"])
                exit(0)
            if type(dest_details["dest_layer"]) != int:
                # in order to avoid an array being given for 'dest_layer'
                print("layer id: %d - 'dest_layer' only takes int values" %layer["layer_id"])
                exit(0)

def process_layer_mems(layer):
    "create or validate the 'layer_mems' entry and its structure"
    if "layer_mems" not in layer:
        # if 'layer_mems' has not been specified, add a 'layer_mems' and bubble-up 'layer_mems' params into it
        layer["layer_mems"] = {}
        for spec in ["lm_max_rows", "lm_row_size"]:
            if spec in layer:
                layer["layer_mems"][spec] = layer[spec]
                del layer[spec]
    else:
        if type(layer["layer_mems"]) == dict:
            layer["layer_mems"] = [layer["layer_mems"]]
        if type(layer["layer_mems"]) != list or len(layer["layer_mems"]) == 0:
            print("layer id: %d - 'layer_mems' must be either a single json object or a non-empty array of json objects" %layer["layer_id"])
            exit(0)
        for layer_mem in layer["layer_mems"]:
            if type(layer_mem) != dict:
                print("layer id: %d - elements of 'layer_mems' must be json objects (python dicts)" %layer["layer_id"])
                exit(0)

def layer_preprocess(layer):
    "complete the structure and add default values to a layer object based on its layer type"

    if "layer_id" not in layer:
        print("there is one or more layers with layer ids not being specified")
        exit(0)

    if "layer_type" not in layer:
        print("layer id: %d - layer type has not been specified" %layer["layer_id"])
        exit(0)
    
    process_dest_entries(layer)
    process_layer_mems(layer)
    # process src_entries 