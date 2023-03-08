# ------------------------------------------------------------------------------------------

def start_mac_row_layer(layers, starting_layer):
    if layers[starting_layer]["layer_class"] == "conv":
        return layers[starting_layer]["filter_size"]+1 
    elif layers[starting_layer]["layer_class"] == "pool":
        return layers[starting_layer]["filter_size"]*2
    else:
        dest_id = layers[starting_layer]["dest_id"]
        return start_mac_row_layer(layers, dest_id)

def default(layer):
    pass

def process_layers(layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows):
    # process each layer type and returns destination layer ID, output image dimensions, and lm_max_rows for the succeeding layer
    if num_in_rows == num_in_cols == num_in_filters == -1: 
        # if input image dimensions are not defined yet 
        if not layer["layer_type"] in ("io_bypass", "output", "output_ext"):
            num_in_rows = layer["num_in_rows"]
            num_in_cols = layer["num_in_cols"]
            num_in_filters = layer["num_in_filters"]
        else: 
            print("Error - input image dimensions are defined in an output or an IO Bypass layer.")
            exit(0)
    
    # creating a json structure to hold the layer specs 
    spec_json = {"layer_id": layer["layer_id"], 
                 "layer_type": layer["layer_type"]}

    # upadating the input image size 
    spec_json["num_in_cols"] = num_in_cols
    spec_json["num_in_rows"] = num_in_rows
    spec_json["num_in_filters"] = num_in_filters

    # reading and updating conv and pool parameters 
    if layer["layer_type"] in ("conv", "pool"):
        filter_size = spec_json["filter_size"]  = layer["filter_size"]
        stride      = spec_json["stride"]       = layer["stride"]
        pad_top     = spec_json["pad_top"]      = layer["pad_top"]
        pad_bot     = spec_json["pad_bot"]      = layer["pad_bot"]
        pad_left    = spec_json["pad_left"]     = layer["pad_left"]
        pad_right   = spec_json["pad_right"]    = layer["pad_right"]
    
    if layer["layer_type"] == "conv":
        dilation    = spec_json["dilation"]     = layer["dilation"]

    # finding the output image size 
    if layer["layer_type"] in ("input", "input_ext", "io_bypass", "output", "output_ext"):
        num_out_rows    = num_in_rows
        num_out_cols    = num_in_cols
        num_out_filters = num_in_filters
        # in IO Module layers, output image dimensions are not updated in spec.json file 

    elif layer["layer_type"] == "conv":
        num_out_rows    = spec_json["num_out_rows"]     = (num_in_rows + pad_top + pad_bot - filter_size - (filter_size - 1)*(dilation - 1))/stride + 1
        num_out_cols    = spec_json["num_out_cols"]     = (num_in_cols + pad_left + pad_right - filter_size - (filter_size - 1)*(dilation - 1))/stride + 1
        # for a conv layer, num_out_filters must be always specified 
        num_out_filters = spec_json["num_out_filters"]  = layer["num_out_filters"]

    elif layer["layer_type"] == "pool":
        num_out_rows    = spec_json["num_out_rows"]     = (num_in_rows + pad_top + pad_bot - filter_size)/stride + 1
        num_out_cols    = spec_json["num_out_cols"]     = (num_in_cols + pad_left + pad_right - filter_size)/stride + 1
        # in pooling layers, num_out_filters would always be equal to num_in_filters 
        num_out_filters = spec_json["num_out_filters"]  = num_in_filters 

    # finding lm_max_rows 
    # -> for an IO Module layer, lm_max_rows must be given as an input to the function 
    if layer["layer_type"] == "conv": lm_max_rows = filter_size + 1
    elif layer["layer_type"] == "pool": lm_max_rows = filter_size * 2

    # updating layer mem params 
    spec_json["layer_mems"] = {}
    spec_json["layer_mems"]["lm_max_rows"] = lm_max_rows
    spec_json["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    spec_json["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    # for pool layers, currently, addr_incr and len parameters should be less than 'num_in_cols' * 'num_out_filters'
    spec_json["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    spec_json["dest_entries"]["len"] = num_out_cols * num_out_filters

    return (spec_json, num_out_rows, num_out_cols, num_out_filters, lm_max_rows)
