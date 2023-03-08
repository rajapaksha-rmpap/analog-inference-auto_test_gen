# ----------------------------------------------------------------

import json 
from pathlib import Path 
from layer_processes import *
from json_handling import *

spec_json_struct = {"io_module": 
                    {
                        "layers":[]
                    }, 
                "mac_rows": 
                    [
                        {
                            "mac_row_id": 0, 
                            "layers": []
                        }
                    ],
                "residual_mems": []
                }
sim_json = {}

in_json_path = "auto_tests_in/"
out_json_path = "auto_tests_out/"
test_name = "dt-1"

input_json_file = open(in_json_path + test_name + ".json")
input_json = json.load(input_json_file)

layers = dict() 
layer_IDs = set(); dest_IDs = set()

if "chips" in input_json.keys(): 
    # do something 
    input_json = input_json["chips"][0]

# putting all the IO module and MAC row layers together into a dict 
# -> when working with different MAC rows and chips, extend the key to a three element tuple 
# -> ex:- (layer_id, mac_row_id, chip_id) 
for io_layer in input_json["io_module"]["layers"]: 
    if not io_layer["layer_id"] in layers.keys(): 
        layers[io_layer["layer_id"]] = io_layer
        layer_IDs.add(io_layer["layer_id"])
        dest_IDs.add(io_layer["dest_id"])
    else: 
        print("ERROR - layer ID %d is not a unique identifier." %(io_layer["layer_id"]))
        exit(0)

for mac_row_layer in input_json["mac_rows"][0]["layers"]: 
    if not mac_row_layer["layer_id"] in layers.keys(): 
        layers[mac_row_layer["layer_id"]] = mac_row_layer
        layer_IDs.add(mac_row_layer["layer_id"])
        dest_IDs.add(mac_row_layer["dest_id"])
    else: 
        print("ERROR - layer ID %d is not a unique identifier." %(mac_row_layer["layer_id"]))
        exit(0)

# finding the starting layer ID 
diff = layer_IDs - dest_IDs
# do evaluate conditions against the count of starting layers 
starting_layer = list(diff)[0]
# do evaluate conditions against starting layer if it belongs to IO module 

num_in_rows = num_in_cols = num_in_filters = -1
lm_max_rows = start_mac_row_layer(layers, starting_layer)
current_layer = starting_layer

while layers[current_layer]["dest_id"] in layer_IDs: 
    # all tha layers are processed based on their layer type 
    layer, num_in_rows, num_in_cols, num_in_filters, lm_max_rows = process_layers(layers[current_layer], num_in_rows, num_in_cols, num_in_filters, lm_max_rows)
    spec_json_struct = fill_in_spec_json(spec_json_struct, layer)
    layer_IDs.remove(current_layer)
    current_layer = layers[current_layer]["dest_id"]

if layer_IDs: 
    # after processing all layers, if there exist any more layers unprocessed, raise a warning or an error
    pass 

# saving spec.json 
try: 
    spec_json_file = open(out_json_path + test_name + "-spec.json", 'w')
except FileNotFoundError: 
    spec_file = Path(out_json_path + test_name + "-spec.json")
    spec_file.touch(exist_ok=True) # take a look at this line of code 
    spec_json_file = open(spec_file, 'w')
json.dump(spec_json_struct, spec_json_file, indent=4)
spec_json_file.close()

print("creating %s-spec.json and %s-sim.json files was successful!" %(test_name, test_name))
