# all the functions regarding calculating and completing layer parameters/specs are defined here. 
import json

def start_mac_row_layer(layers, starting_layer):
    "find the value of lm_max_rows for the input and io_bypass layers"
    # find the first mac row layer in NN, and derive the value of lm_max_rows, and take it as lm_max_rows for the input and io_bypass layers 
    if layers[starting_layer]["layer_type"] == "conv":
        return (layers[starting_layer]["filter_size"], layers[starting_layer]["filter_size"]+layers[starting_layer]["stride"])
    elif layers[starting_layer]["layer_type"] == "pool":
        return (layers[starting_layer]["filter_size"], layers[starting_layer]["filter_size"]*2)
    else:
        dest_id = layers[starting_layer]["dest_id"]
        return start_mac_row_layer(layers, dest_id)

def default(layer):
    default_json_file = open("default.json")
    default_json = json.load(default_json_file)

    #setting spec file
    #setting destination entries
    if not "addr" in layer.keys():
        layer["dest_entries"][0]["addr"] = default_json["dest_entries"]["addr"]
    else:
        layer["dest_entries"][0]["addr"] = layer["addr"]
        del layer["addr"]
        
    if not "dest_addr" in layer.keys():
        layer["dest_entries"][0]["dest_details"][0]["dest_addr"] = default_json["dest_entries"]["dest_addr"]
    else:
        layer["dest_entries"][0]["dest_details"][0]["dest_addr"] = layer["dest_addr"]
        del layer["dest_addr"]
        
    if not "mem_index" in layer.keys():
        layer["dest_entries"][0]["dest_details"][0]["mem_index"] = default_json["dest_entries"]["mem_index"]
    else:
        layer["dest_entries"][0]["dest_details"][0]["mem_index"] = layer["mem_index"]
        del layer["mem_index"]
 
    if not "mem_type" in layer.keys():
        layer["dest_entries"][0]["dest_details"][0]["mem_type"] = default_json["dest_entries"]["mem_type"]
    else:
        layer["dest_entries"][0]["dest_details"][0]["mem_type"] = layer["mem_type"]
        del layer["mem_type"]
        

    if not "gen_sync" in layer.keys():
        layer["dest_entries"][0]["dest_details"][0]["gen_sync"] = default_json["dest_entries"]["gen_sync"]
    else:
        layer["dest_entries"][0]["dest_details"][0]["gen_sync"] = layer["gen_sync"]
        del layer["gen_sync"]
        
    del layer["dest_id"]

    #filling rest
    rest = default_json[layer["layer_type"]]
    for el in rest:
        if el not in layer.keys():
            layer[el] = rest[el]
    default_json_file.close()
            
    return layer 

def process_layers(layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows):
    'take in the json object specifying a layer from input json file and complete it with calculated specs and default values'
    
    # upadating the output/input image size 
    if layer["layer_type"] in ("output", "output_ext"):
        layer["num_out_cols"] = num_in_cols
        layer["num_out_rows"] = num_in_rows
        layer["num_out_filters"] = num_in_filters
    else: 
        layer["num_in_cols"] = num_in_cols
        layer["num_in_rows"] = num_in_rows
        layer["num_in_filters"] = num_in_filters

    # finding the output image size 
    if layer["layer_type"] in ("input", "input_ext", "io_bypass", "output", "output_ext"):
        # in IO Module layers, output image dimensions are same as those of the input image 
        num_out_rows    = num_in_rows
        num_out_cols    = num_in_cols
        num_out_filters = num_in_filters
        # output image dimensions are not updated in spec.json file for IO Module layers 

    elif layer["layer_type"] == "conv":
        num_out_rows = layer["num_out_rows"] = (num_in_rows + layer["pad_top"] + layer["pad_bot"] - layer["filter_size"] - (layer["filter_size"]-1)*(layer["dilation"]-1)) // layer["stride"] + 1
        num_out_cols = layer["num_out_cols"] = (num_in_cols + layer["pad_left"] + layer["pad_right"] - layer["filter_size"] - (layer["filter_size"]-1)*(layer["dilation"]-1)) // layer["stride"] + 1
        # for a conv layer, num_out_filters must be always specified 
        num_out_filters = layer["num_out_filters"]
        # calculating num_blocks 
        layer["num_blocks"] = block_cal(layer["filter_size"], layer["stride"], layer["nconvs"][0], layer["num_xbars"][0], layer["num_in_cols"])

    elif layer["layer_type"] == "pool":
        num_out_rows = layer["num_out_rows"] = (num_in_rows + layer["pad_top"] + layer["pad_bot"] - layer["filter_size"]) // layer["stride"] + 1
        num_out_cols = layer["num_out_cols"] = (num_in_cols + layer["pad_left"] + layer["pad_right"] - layer["filter_size"]) // layer["stride"] + 1
        # in pooling layers, num_out_filters would always be equal to num_in_filters 
        num_out_filters = layer["num_out_filters"] = num_in_filters 
        # calculating num_blocks if num_xbars and nconvs are specified in input.json for a pool layer 
        if "nconvs" in layer.keys() and "num_xbars" in layer.keys():
            layer["num_blocks"] = block_cal(layer["filter_size"],layer["stride"],layer["nconvs"][0],layer["num_xbars"][0],layer["num_in_cols"])

    # finding lm_max_rows 
    # -> for an IO Module layer, lm_max_rows must be given as an input to the function 
    if layer["layer_type"] == "conv": lm_max_rows = layer["filter_size"] + layer["stride"]
    elif layer["layer_type"] == "pool": lm_max_rows = layer["filter_size"] * 2

    # updating layer mem params 
    layer["layer_mems"] = [{}]
    layer["layer_mems"][0]["lm_max_rows"] = lm_max_rows
    layer["layer_mems"][0]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    dest_layer = layer["dest_id"]
    layer["dest_entries"] = [{"dest_details": [{"dest_layer": dest_layer}]}]
    # for pool layers, currently, addr_incr and len parameters should be less than 'num_in_cols' * 'num_out_filters'
    layer["dest_entries"][0]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    layer["dest_entries"][0]["len"] = num_out_cols * num_out_filters

    # completing other specs with the default values 
    layer = default(layer)

    return (layer, num_out_rows, num_out_cols, num_out_filters, lm_max_rows, dest_layer)

def block_cal(filter_size,stride,nconvs,num_xbars,num_in_cols):
    "caluculates num_of_blocks"
    num_blocks = 1
    blocksize = filter_size + (nconvs * num_xbars - 1) * stride
    while blocksize < num_in_cols :
        blocksize += stride + (nconvs * num_xbars - 1) * stride
        num_blocks += 1

    return num_blocks