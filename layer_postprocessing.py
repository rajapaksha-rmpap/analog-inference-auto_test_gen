# do the verifications and modifications to the layer specs after layer processing 

import json

tab = '\t'

def layer_postprocess(layer):
    
    residual_num_xbars = residual_nconvs = -1

    # reading and validating 'num_xbars'
    if type(layer["num_xbars"]) == int: 
        prm_num_xbars = layer["num_xbars"]
    elif type(layer["num_xbars"]) == list and len(layer["num_xbars"]) == 2:
        prm_num_xbars, residual_num_xbars = layer["num_xbars"]
    else: 
        print("layer id: %d - invalid entry for 'num_xbars'" %layer["layer_id"]); return 0 #exit(0)
    if not 1 <= prm_num_xbars <= 5 or (residual_num_xbars != -1 and not 1 <= residual_num_xbars <= 5):
        print("layer id: %d - 'num_xbars' must only have values with in the range of [1, 5]" %layer["layer_id"])
        return 0 #exit(0)

    # reading and validating 'nconvs' 
    if type(layer["nconvs"]) == int: 
        prm_nconvs = layer["nconvs"]
    elif type(layer["nconvs"]) == list and len(layer["nconvs"]) == 2:
        prm_nconvs, residual_nconvs = layer["nconvs"]
    else: 
        print("layer id: %d - invalid entry for 'nconvs'" %layer["layer_id"]); return 0 #exit(0)
    if not 1 <= prm_nconvs or (residual_nconvs != -1 and not 1 <= residual_nconvs):
        print("layer id: %d - 'nconvs' must only have values greater than 1" %layer["layer_id"])
        return 0 #exit(0)

    # new algorithm ----------------------------------------------------------------------------------
    if layer["num_out_cols"] < prm_nconvs:
        print("layer id: %d - 'nconvs' %d is larger than 'num_out_cols' %d" %(layer["layer_id"], prm_nconvs, layer["num_out_cols"]))
        return 0 #exit(0)

    total_convs = 0
    est_residual_num_xbars = 0
    est_num_blocks = 1
    while True:
        est_residual_num_xbars += 1
        total_convs += prm_nconvs
        if total_convs >= layer["num_out_cols"]:
            break
        if est_residual_num_xbars == prm_num_xbars:
            est_num_blocks += 1
            est_residual_num_xbars = 0
    
    excess_convs = total_convs - layer["num_out_cols"]
    if excess_convs == 0:
        est_residual_nconvs = prm_nconvs
    else:
        est_residual_nconvs = layer["num_out_cols"] - total_convs + prm_nconvs 
    est_num_xbars = [prm_num_xbars, est_residual_num_xbars]
    est_nconvs    = [prm_nconvs   , est_residual_nconvs   ]

    # validate the entries given by the user (if provided only)
    if residual_nconvs != -1 and residual_nconvs != est_residual_nconvs:
        print(f"layer id: {layer['layer_id']} - specified 'nconvs' may be incorrect;     estimated values are 'num_blocks' {est_num_blocks}, 'num_xbars' {est_num_xbars}, 'nconvs {est_nconvs}")
        return 0 #exit(0)
    elif "num_blocks" in layer and layer["num_blocks"] != est_num_blocks:
        print(f"layer id: {layer['layer_id']} - specified 'num_blocks' may be incorrect; estimated values are 'num_blocks' {est_num_blocks}, 'num_xbars' {est_num_xbars}, 'nconvs {est_nconvs}")
        return 0 #exit(0)
    elif residual_num_xbars != -1 and residual_num_xbars != est_residual_num_xbars:
        print(f"layer id: {layer['layer_id']} - specified 'num_xbars' may be incorrect;  estimated values are 'num_blocks' {est_num_blocks}, 'num_xbars' {est_num_xbars}, 'nconvs {est_nconvs}")
        return 0 #exit(0)

    # write the results 
    layer["num_blocks"] = est_num_blocks
    layer["num_xbars"]  = est_num_xbars 
    layer["nconvs"]     = est_nconvs 

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# # test code 

with open("testings_out/layers_categorized-with_test_names.json") as layer_cat:
    layers = json.load(layer_cat)

count = 0
# test all the conv layers 
for key in layers["conv"]:
    conv_layer = layers["conv"][key]
    ref_num_blocks = conv_layer["num_blocks"]
    ref_num_xbars  = conv_layer["num_xbars"]
    ref_nconvs     = conv_layer["nconvs"]

    # now reduce the layer 
    del conv_layer["num_blocks"]
    conv_layer["num_xbars"] = conv_layer["num_xbars"][0]
    conv_layer["nconvs"]    = conv_layer["nconvs"][0]
    
    result = layer_postprocess(conv_layer)
    if result != None:
        # a known error has occured 
        print(f"a deviation: num_out_cols - {conv_layer['num_out_cols']}, num_blocks - {ref_num_blocks}, {tab}num_xbars - {ref_num_xbars}, {tab}nconvs - {ref_nconvs}, \
            {tab}test - {key.split(', ')[0].strip('() ')} -> {key.split(', ')[1].strip('() ')}")
        count += 1
        perm = input("pass [y/n]? - ")
        if perm == '0': exit(0)

    # no known error has occured, however validate the overwritten values 
    elif not (ref_num_blocks == conv_layer["num_blocks"] and ref_num_xbars == conv_layer["num_xbars"] and ref_nconvs == conv_layer["nconvs"]):
        print(f"a result deviation: num_out_cols - {conv_layer['num_out_cols']}, num_blocks - {ref_num_blocks} -> {conv_layer['num_blocks']}, {tab}num_xbars - {ref_num_xbars} -> {conv_layer['num_xbars']}, \
            {tab}nconvs - {ref_nconvs} -> {conv_layer['nconvs']}, {tab}test - {key.split(', ')[0].strip('() ')}, {tab}layer_id - {key.split(', ')[1].strip('() ')}")
        count += 1
        perm = input("pass [y/n]? - ")
        if perm == '0': exit(0)

# creating the report 
print("---------------------------------------------------------------------------------------------------------")
print("total num of conv layers: %d" %(len(layers["conv"])))
print("num of successes        : %d" %(len(layers["conv"])-count))
print("num of failuers         : %d" %count)
