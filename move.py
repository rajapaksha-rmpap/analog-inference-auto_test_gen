# perform file moving from sw_be repo to current auto_test_gen folder 

import os
import shutil
import argparse 

def move(file_name, in_path="../sw_be/desgen/hwtests/in/", dest_path="in/"):
    "copy a file (rather than moving it) with the specified name available in the in_path to dest_path"
    # not a complete or an optimal function 
    
    in_file = in_path + file_name
    if os.path.exists(in_file) and os.path.isfile(in_file):
        shutil.copy(in_file, dest_path)
    else: 
        if os.path.exists(in_path) and os.path.isdir(in_path):
            print("file %s is not found in %s" %(file_name, os.path.abspath(in_path)))
        else:
            print("%s path is not found" %(in_path))

# create the CLI 
parser = argparse.ArgumentParser()
parser.add_argument('file_names', nargs='+')
parser.add_argument('--src_path', default="../sw_be/desgen/hwtests/in/")
parser.add_argument('--dst_path', default="in/")
args = parser.parse_args()

for test_name in args.file_names:
    move(test_name, args.src_path, args.dst_path)
    