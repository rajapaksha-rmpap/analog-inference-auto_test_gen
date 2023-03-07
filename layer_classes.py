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

def input_layer(layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows):
    if (num_in_rows == num_in_cols == num_in_filters == -1): 
        # if an input layer class, read the input image size  
        num_in_rows = layer["num_in_rows"]
        num_in_cols = layer["num_in_cols"]
        num_in_filters = layer["num_in_filters"]
    
    spec_json = {"layer_id": layer["layer_id"], 
                 "layer_class": "input", 
                 "layer_type": layer["layer_type"]}

    # finding the output image size
    num_out_rows = num_in_rows
    num_out_cols = num_in_cols
    num_out_filters = num_in_filters
    
    # upadating the input image size 
    spec_json["num_in_cols"] = num_in_cols
    spec_json["num_in_rows"] = num_in_rows
    spec_json["num_in_filters"] = num_in_filters
    
    # updating layer mem params 
    spec_json["layer_mems"] = {}
    spec_json["layer_mems"]["lm_max_rows"] = lm_max_rows
    spec_json["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    spec_json["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    spec_json["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    spec_json["dest_entries"]["len"] = num_out_cols * num_out_filters

    # filling the other parameters with default values if not specified explicitly 
    # spec_json = default(spec_json)

    return spec_json, num_out_rows, num_out_cols, num_out_filters

def io_bypass_layer(layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows):
    # an IO Bypass layer will not contain input image size, and take in the output image size of the preceeding input layer 
    # assumed that the only 'layer_type' for IO Bypass layers is 'io_bypass'. (constant)
    spec_json = {"layer_id": layer["layer_id"], 
                 "layer_class": "io_bypass", 
                 "layer_type": "io_bypass"}

    # finding the output image size
    num_out_rows = num_in_rows
    num_out_cols = num_in_cols
    num_out_filters = num_in_filters
    
    # upadating the input image size 
    spec_json["num_in_cols"] = num_in_cols
    spec_json["num_in_rows"] = num_in_rows
    spec_json["num_in_filters"] = num_in_filters

    # updating layer mem params 
    spec_json["layer_mems"] = {}
    spec_json["layer_mems"]["lm_max_rows"] = lm_max_rows
    spec_json["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    spec_json["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    spec_json["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    spec_json["dest_entries"]["len"] = num_out_cols * num_out_filters

    # filling the other parameters with default values if not specified explicitly 
    # spec_json = default(spec_json)

    return spec_json, num_out_rows, num_out_cols, num_out_filters

def output_layer(layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows):
    # an output layer will not contain input image size, and take in the output image size of the preceeding input layer 
    spec_json = {"layer_id": layer["layer_id"], 
                 "layer_class": "output", 
                 "layer_type": layer["layer_type"]}

    # finding the output image size
    num_out_rows = num_in_rows
    num_out_cols = num_in_cols
    num_out_filters = num_in_filters
    
    # upadating the input image size 
    spec_json["num_in_cols"] = num_in_cols
    spec_json["num_in_rows"] = num_in_rows
    spec_json["num_in_filters"] = num_in_filters

    # updating layer mem params 
    spec_json["layer_mems"] = {}
    spec_json["layer_mems"]["lm_max_rows"] = lm_max_rows
    spec_json["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    spec_json["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    spec_json["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    spec_json["dest_entries"]["len"] = num_out_cols * num_out_filters

    # filling the other parameters with default values if not specified explicitly 
    # spec_json = default(spec_json)

    return spec_json, num_out_rows, num_out_cols, num_out_filters

def conv_layer(layer, num_in_rows, num_in_cols, num_in_filters):
    # if a conv layer is the very first layer in a test, then input image size params are read
    if (num_in_rows == num_in_cols == num_in_filters == -1): 
        num_in_rows = layer["num_in_rows"]
        num_in_cols = layer["num_in_cols"]
        num_in_filters = layer["num_in_filters"]
    
    spec_json = {"layer_id": layer["layer_id"], 
                 "layer_class": "conv", 
                 "layer_type": "conv"}
    
    # upadating the input image size 
    spec_json["num_in_cols"] = num_in_cols
    spec_json["num_in_rows"] = num_in_rows
    spec_json["num_in_filters"] = num_in_filters

    # reading and updating conv params 
    filter_size = spec_json["filter_size"]  = layer["filter_size"]
    dilation    = spec_json["dilation"]     = layer["dilation"]
    stride      = spec_json["stride"]       = layer["stride"]
    pad_top     = spec_json["pad_top"]      = layer["pad_top"]
    pad_bot     = spec_json["pad_bot"]      = layer["pad_bot"]
    pad_left    = spec_json["pad_left"]     = layer["pad_left"]
    pad_right   = spec_json["pad_right"]    = layer["pad_right"]

    # finding the output image size 
    num_out_rows = (num_in_rows + pad_top + pad_bot - filter_size - (filter_size - 1)*(dilation - 1))/stride + 1
    num_out_cols = (num_in_cols + pad_left + pad_right - filter_size - (filter_size - 1)*(dilation - 1))/stride + 1
    num_out_filters = layer["num_out_filters"]
    
    # updating the output image size 
    spec_json["num_out_cols"] = num_out_cols
    spec_json["num_out_rows"] = num_out_rows
    spec_json["num_out_filters"] = num_out_filters

    # updating layer mem params 
    lm_max_rows = filter_size + 1 
    spec_json["layer_mems"] = {}
    spec_json["layer_mems"]["lm_max_rows"] = lm_max_rows
    spec_json["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    spec_json["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    spec_json["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    spec_json["dest_entries"]["len"] = num_out_cols * num_out_filters

    # reading and updating processing params 
    num_blocks  = spec_json["num_blocks"]   = layer["num_blocks"]
    num_xbars   = spec_json["num_xbars"]    = layer["num_xbars"]
    num_convs   = spec_json["nconvs"]       = layer["num_convs"]

    # filling the other parameters with default values if not specified explicitly 
    # spec_json = default(spec_json)

    return spec_json, num_out_rows, num_out_cols, num_out_filters

def pool_layer(layer, num_in_rows, num_in_cols, num_in_filters):
    # if a pool layer is the very first layer in a test, then input image size params are read from the layer. 
    # otherwise, take the output image size of the preceeding layer as the input image size 
    if (num_in_rows == num_in_cols == num_in_filters == -1): 
        num_in_rows = layer["num_in_rows"]
        num_in_cols = layer["num_in_cols"]
        num_in_filters = layer["num_in_filters"]
    
    spec_json = {"layer_id": layer["layer_id"], 
                 "layer_class": "pool", 
                 "layer_type": "pool"}
    
    # upadating the input image size 
    spec_json["num_in_cols"] = num_in_cols
    spec_json["num_in_rows"] = num_in_rows
    spec_json["num_in_filters"] = num_in_filters

    # reading and updating conv params 
    filter_size = spec_json["filter_size"]  = layer["filter_size"]
    stride      = spec_json["stride"]       = layer["stride"]
    pad_top     = spec_json["pad_top"]      = layer["pad_top"]
    pad_bot     = spec_json["pad_bot"]      = layer["pad_bot"]
    pad_left    = spec_json["pad_left"]     = layer["pad_left"]
    pad_right   = spec_json["pad_right"]    = layer["pad_right"]

    # finding the output image size 
    num_out_rows = (num_in_rows + pad_top + pad_bot - filter_size)/stride + 1
    num_out_cols = (num_in_cols + pad_left + pad_right - filter_size)/stride + 1
    # in pooling layers, num_out_filters would always be equal to num_in_filters 
    num_out_filters = num_in_filters 
    
    # updating the output image size 
    spec_json["num_out_cols"] = num_out_cols
    spec_json["num_out_rows"] = num_out_rows
    spec_json["num_out_filters"] = num_out_filters

    # updating layer mem params 
    lm_max_rows = filter_size * 2 
    spec_json["layer_mems"] = {}
    spec_json["layer_mems"]["lm_max_rows"] = lm_max_rows
    spec_json["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    # ******* for pooling layers, currently len and addr_incr <= num_in_cols * num_out_filters ****** 
    spec_json["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    spec_json["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    spec_json["dest_entries"]["len"] = num_out_cols * num_out_filters

    # reading and updating processing params 
    num_pools  = spec_json["pool_out_filters"]   = layer["num_pools"]

    # filling the other parameters with default values if not specified explicitly 
    # spec_json = default(spec_json)

    return spec_json, num_out_rows, num_out_cols, num_out_filters
