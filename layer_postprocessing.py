# do the verifications and modifications to the layer specs after layer processing 

import json

def layer_postprocess(layer, count):
    "do verifications of the specs of the processed layer"

    # find or verify if sepcified the nconvs, num_xbars, and num_blocks
    # -> firstly, let me verify the exact relationship between num_blocks, num_xbars, nconvs
    starting_blocks = layer["num_blocks"]-1 if layer["num_blocks"] > 1 else 1
    ending_block = 1 if layer["num_blocks"] > 1 else 0
    starting_blocks_starting_xbars = layer["num_xbars"][0]-1 if layer["num_xbars"][0] > 1 else 1
    starting_blocks_ending_xbar = 1 if layer["num_xbars"][0] > 1 else 0
    ending_block_starting_xbars = layer["num_xbars"][1]-1 if layer["num_xbars"][1] > 1 else 1
    ending_block_ending_xbar = 1 if layer["num_xbars"][1] > 1 else 0
    starting_xbars_nconvs = layer["nconvs"][0]
    ending_xbar_nconvs = layer["nconvs"][1]

    # if not layer["num_out_cols"] == starting_blocks * (starting_blocks_starting_xbars * starting_xbars_nconvs + starting_blocks_ending_xbar * ending_xbar_nconvs) + \
        # ending_block * (ending_block_starting_xbars * starting_xbars_nconvs + ending_block_ending_xbar * ending_xbar_nconvs):
        # print("a deviation:", layer["num_blocks"], layer["num_xbars"], layer["nconvs"])
        # exit(0)

    if not layer["num_out_cols"] == starting_blocks * layer["num_xbars"][0] * layer["nconvs"][0] + \
        ending_block * layer["num_xbars"][1] * layer["nconvs"][1]:
        print("a deviation:", layer["num_blocks"], layer["num_xbars"], layer["nconvs"], "********************************************************************")
        return "error"
    
    return count + 1
    

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# test code 

with open("testings_out/layers_categorized-with_test_names.json") as layer_cat:
    layers = json.load(layer_cat)

# access all the conv layers 
count = 0; deviations = {}
for conv_layer_key in layers["conv"]:
    print(conv_layer_key)
    flag = layer_postprocess(layers["conv"][conv_layer_key], count)
    if flag == 'error': deviations[conv_layer_key] = layers["conv"][conv_layer_key]
    else: count = flag

print("no. of total conv cases          = %d" %len(layers["conv"]))
print("no. of successes for hypothesis  = %d" %count)
print("no. of deviations                = %d" %(len(deviations)))

print(arr := set([key.split(',')[0].strip("() ") for key in deviations]))
print(len(arr))