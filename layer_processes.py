# ------------------------------------------------------------------------------------------

def start_mac_row_layer(layers, starting_layer):
    "find the value of lm_max_rows for the input and io_bypass layers"
    # find the first mac row layer in NN, and derive the value of lm_max_rows, and take it as lm_max_rows for the input and io_bypass layers 
    if layers[starting_layer]["layer_class"] == "conv":
        return layers[starting_layer]["filter_size"]+1 
    elif layers[starting_layer]["layer_class"] == "pool":
        return layers[starting_layer]["filter_size"]*2
    else:
        dest_id = layers[starting_layer]["dest_id"]
        return start_mac_row_layer(layers, dest_id)

def default(layer):
    # ****** complete this function ******
    # if user has specified some params (which are not usually changed from test to test), do not overwrite them with default values 
    # all the other unspecified params must be filled with its usual default values. 

    # also, incompletely filled sim.json file must also be completed with default values using this function 
    # for both cases, default values are taken from 'default.json' file 
    # notice the structure of a layer after it being processed through the function 'process_layer'
    return layer 

def process_layers(layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows):
    'take in the json object specifying a layer from input json file and complete it with calculated specs and default values'
    
    # upadating the input image size 
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
        num_out_rows = layer["num_out_rows"] = (num_in_rows + layer["pad_top"] + layer["pad_bot"] - layer["filter_size"] - (layer["filter_size"]-1)*(layer["dilation"]-1)) / layer["stride"] + 1
        num_out_cols = layer["num_out_cols"] = (num_in_cols + layer["pad_left"] + layer["pad_right"] - layer["filter_size"] - (layer["filter_size"]-1)*(layer["dilation"]-1)) / layer["stride"] + 1
        # for a conv layer, num_out_filters must be always specified 
        num_out_filters = layer["num_out_filters"]

    elif layer["layer_type"] == "pool":
        num_out_rows = layer["num_out_rows"] = (num_in_rows + layer["pad_top"] + layer["pad_bot"] - layer["filter_size"]) / layer["stride"] + 1
        num_out_cols = layer["num_out_cols"] = (num_in_cols + layer["pad_left"] + layer["pad_right"] - layer["filter_size"]) / layer["stride"] + 1
        # in pooling layers, num_out_filters would always be equal to num_in_filters 
        num_out_filters = layer["num_out_filters"] = num_in_filters 

    # finding lm_max_rows 
    # -> for an IO Module layer, lm_max_rows must be given as an input to the function 
    if layer["layer_type"] == "conv": lm_max_rows = layer["filter_size"] + 1
    elif layer["layer_type"] == "pool": lm_max_rows = layer["filter_size"] * 2

    # updating layer mem params 
    layer["layer_mems"] = {}
    layer["layer_mems"]["lm_max_rows"] = lm_max_rows
    layer["layer_mems"]["lm_row_size"] = num_in_cols * num_in_filters
    
    # updating dest entries 
    layer["dest_entries"] = {"dest_details": [{"dest_layer": layer["dest_id"]}]}
    # for pool layers, currently, addr_incr and len parameters should be less than 'num_in_cols' * 'num_out_filters'
    layer["dest_entries"]["dest_details"][0]["addr_incr"] = num_out_cols * num_out_filters
    layer["dest_entries"]["len"] = num_out_cols * num_out_filters

    # completing other specs with the default values 
    layer = default(layer)

    return (layer, num_out_rows, num_out_cols, num_out_filters, lm_max_rows)
