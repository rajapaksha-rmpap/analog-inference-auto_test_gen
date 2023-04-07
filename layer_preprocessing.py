# take layer objects from the input json file and complete them with appropriate default values based on their layer type. 

import json
import copy
import time

# change 'add_defaults' function depending on the format of the 'defaults.json' file
def add_defaults(layer_level, root, defaults, optional=False):
    "add the default values into the layer if they are not speicifed by the user"
    # here, value of root must be one of '', 'dest_entries/', 'dest_entries/dest_details/', 'layer_mems/', or 'src_entries/'
    for spec in defaults:
        if spec.startswith(root):
            spec = spec[len(root):]     # stripping the starting root
            if '/' in spec: continue    # the spec belogns to an upper json level
            if spec in layer_level: continue # user has already specified the spec 

            default, optionality = defaults[root + spec] # **************** change here **************** 
            if default in ("object_array", "well_defined", "a_json-object"): 
                # 'object_array' -> spec's value is an array of objects 
                # 'a_json-object' -> spec's value is a json object
                # 'well_defined' -> spec's value has to be calculated in the next stage of 'auto_test_gen'
                continue 
            # if user specified not to include opitonal specs, 
            if (not optional) and (optionality == "optional"): continue
            # otherwise, write the spec with its default value 
            layer_level[spec] = default

def process_dest_entries(layer, defaults):
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
        
        # add default 'dest_entry' params 
        add_defaults(dest_entry, 'dest_entries/', defaults)
        # for spec in ['addr', 'len']:
        #     if root_spec := 'dest_entries/' + spec in defaults:
        #         if spec in dest_entry: pass
        #         else: dest_entry[spec] = defaults[root_spec]

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
            print(json.dumps(layer))
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
            # add default 'dest_details' params 
            add_defaults(dest_details, 'dest_entries/dest_details/', defaults)
        put_specs_inorder(dest_entry)

def process_layer_mems(layer, defaults):
    "create or validate the 'layer_mems' entry and its structure"
    if "layer_mems" not in layer:
        # if 'layer_mems' has not been specified, add a 'layer_mems' and bubble-up 'layer_mems' params into it
        layer["layer_mems"] = {}
        for spec in ["lm_max_rows", "lm_row_size"]:
            if spec in layer:
                layer["layer_mems"][spec] = layer[spec]
                del layer[spec]
    if type(layer["layer_mems"]) == dict:
        layer["layer_mems"] = [layer["layer_mems"]]
    if type(layer["layer_mems"]) != list or len(layer["layer_mems"]) == 0:
        print("layer id: %d - 'layer_mems' must be either a single json object or a non-empty array of json objects" %layer["layer_id"])
        exit(0)
    for layer_mem in layer["layer_mems"]:
        if type(layer_mem) != dict:
            print("layer id: %d - elements of 'layer_mems' must be json objects (python dicts)" %layer["layer_id"])
            exit(0)
        # add default 'layer_mems' params 
        add_defaults(layer_mem, 'layer_mems/', defaults)

def process_col_splits(layer, defaults):
    "create or validate the 'col_splits' entry and its structure (only specified in 'conv' layer class)"
    if "col_splits" not in layer:
        # if 'col_splits' has not been specified, add a 'col_splits' and bubble-up 'col_splits' params into it
        layer["col_splits"] = {}
        for spec in ["grp_shift", "splits", "shift", "sign"]:
            if spec in layer:
                layer["col_splits"][spec] = layer[spec]
                del layer[spec]
    if type(layer["col_splits"]) != dict:
        print("layer id: %d - 'col_splits' must be a json object" %layer["layer_id"])
        exit(0)
    # add default 'col_splits' params 
    add_defaults(layer["col_splits"], "col_splits/", defaults)

    if "splits" not in layer["col_splits"]:
        layer["col_splits"]["splits"] = {}
        for spec in ["shift", "sign"]:
            if spec in layer["col_splits"]:
                layer["col_splits"]["splits"][spec] = layer["col_splits"][spec]
                del layer["col_splits"][spec]
    if type(layer["col_splits"]["splits"]) == dict:
        layer["col_splits"]["splits"] = [layer["col_splits"]["splits"]]
    if type(layer["col_splits"]["splits"]) != list:
        print(json.dumps(layer, indent=4))
        print("layer id: %d - 'col_splits/splits' must be either a single json object or a non-empty array of json objects" %layer["layer_id"])
        exit(0)
    
    for split in layer["col_splits"]["splits"]:
        if type(split) != dict:
            print("layer id: %d - elements of 'col_splits/splits' must be json objects (python dicts)" %layer["layer_id"])
            exit(0)
        # add default 'col_splits/splits' params 
        add_defaults(split, 'col_splits/splits/', defaults)
    put_specs_inorder(layer)

def process_src_entries(layer, defaults):
    "create or validate the 'src_entries' entry and its structure (only specified in 'conv', 'add', and 'fetch_global' layer types)"
    if "src_entries" not in layer:
        # if 'src_entries' has not been specified, add a 'src_entries' and bubble-up 'src_entries' params into it
        layer["src_entries"] = {}
        for spec in ["dst_index", "dst_layer", "dst_mem_type", "src_addr", "src_addr_incr", "src_index", "src_layer", "src_len", "src_mem_type"]:
            if spec in layer:
                layer["src_entries"][spec] = layer[spec]
                del layer[spec]
    if type(layer["src_entries"]) == dict:
        if len(layer["src_entries"]) == 0: 
            # the user has not specified either a src_entry or associate params in the input json
            layer["src_entries"] = []
            return 
        layer["src_entries"] = [layer["src_entries"]]
    if type(layer["src_entries"]) != list:
        print("layer id: %d - 'src_entries' must be either a single json object or an array of json objects" %layer["layer_id"])
        exit(0)
    
    for src_entry in layer["src_entries"]:
        if type(src_entry) != dict:
            print("layer id: %d - elements of 'src_entries' must be json objects (python dicts)" %layer["layer_id"])
            exit(0)
        if "src_index" not in src_entry:
            print("layer id: %d - 'src_index' has not been specified" %layer["layer_id"])
            exit(0)

        # add default 'src_entries/' params 
        add_defaults(src_entry, 'src_entries/', defaults)

def put_specs_inorder(layer):
    "put the specs in an easy-to-read order"
    layer_copy = copy.deepcopy(layer)
    for key in layer_copy: del layer[key]
    if "layer_id" in layer: layer["layer_id"] = layer_copy["layer_id"]
    if "layer_type" in layer: layer["layer_type"] = layer_copy["layer_type"]
    
    # otherwise put them in alphabetical order 
    keys = list(layer_copy.keys()); keys.sort()
    for key in keys:
        layer[key] = layer_copy[key]

def layer_preprocess(layer):
    "complete the structure and add default values to a layer object based on its layer type"

    if "layer_id" not in layer:
        print("there is one or more layers with layer ids not being specified")
        exit(0)

    if "layer_type" not in layer:
        print("layer id: %d - layer type has not been specified" %layer["layer_id"])
        exit(0)
    
    # reading default values
    with open("defaults.json") as default_file:
        defaults = json.load(default_file)
    layer_defaults = defaults[layer["layer_type"]]
    
    process_dest_entries(layer, layer_defaults)
    process_layer_mems(layer, layer_defaults)
    # for layers of 'conv' layer_class, process 'col_splits'
    if layer["layer_type"] in ('conv', 'dilate', 'transpose'):
        process_col_splits(layer, layer_defaults)
    # for layer_types; 'conv', 'add', and 'fetch_global', process 'src_entries'
    if layer["layer_type"] in ('conv', 'add', 'fetch_global'):
        process_src_entries(layer, layer_defaults)
        if layer["src_entries"] == [{}]: layer["src_entries"] = [] # *******

    # fill in other default specs (this must be called at the end to avoid overwritting dest_entries, layer_mems, col_splits, and src_entries))
    # to add optional specs into final spec.json file -> set 'optional'=True
    add_defaults(layer, '', layer_defaults, optional=False)
    put_specs_inorder(layer)

# -------------------------------------------------------------------------------------------
# test code 
start = time.time()
test_name = "yolov5-best-new"
with open("auto_tests_in/" + test_name + ".json") as input_file:
    input_json = json.load(input_file)

# gathering all the layers in the input.json 
layers = {}
if "chips" in input_json:
    input_json = input_json["chips"][0]
for layer in input_json["io_module"]["layers"]:
    layers[layer["layer_id"]] = layer
for mac_row in input_json["mac_rows"]:
    for layer in mac_row["layers"]:
        layers[layer["layer_id"]] = layer

# pre-processing them
for layer in layers.values():
    layer_preprocess(layer)

# now, input_json must contain all the filled-in layers
with open("auto_tests_out/" +  test_name + "-spec.json", 'w') as output_file:
    json.dump(input_json, output_file, indent=4)

end = time.time()
print("time elpased:", end-start)
