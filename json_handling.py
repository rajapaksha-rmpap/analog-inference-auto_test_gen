# contain functions for creating, accessing, and manipulating json files 

def fill_in_spec_json(spec_json, layer):
    # complete the spec.json file by filling in the layers 
    if layer["layer_type"] in ("input", "input_ext", "io_bypass", "output", "output_ext"): 
        spec_json["io_module"]["layers"].append(layer)
    else: 
        spec_json["mac_rows"][0]["layers"].append(layer)
    return spec_json 