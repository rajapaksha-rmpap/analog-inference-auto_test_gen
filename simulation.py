# must be defined within the main 'auto_test_gen.py' script

import os
import json
from argparse import ArgumentParser
from runhwtests_custom import runhwtests
from json_handling import get_a_file_list

tab = '\t'
hwtests_in_dir = "../sw_be/desgen/hwtests/in/" # change later
in_test_list = get_a_file_list(hwtests_in_dir, trailor="-spec.json", name_only=False)
in_test_list.sort()
cwd = os.getcwd()

def simulate(testnames, fsim=True, asmsim=True, vcd=False):
    "run fsim and asmsim for the specified input tests"
    json_template = {
        "not enabled": [],
        "fsim failing": {
            "ExecutionError": [], 
            "OutTXTMistmatchError": [], 
            "ResultComparisonError": []
        }, 
        "asmsim failing": {
            "AsmsimDisabled": [], 
            "asmsimExecutionError": []
        },
        "unknown error": [],
        "successes": []
    }

    if len(testnames) == 0:
        # if no test case is specified, run all the input test casees in input dir
        sim_all = input("do you want to run all the tests in %s/ [Y/n] (no. of tests - %d)? :- " %(os.path.abspath(hwtests_in_dir), len(in_test_list)))
        if sim_all not in ("y", "Y"): 
            print("Auto Test Generation is exiting!")
            exit(0)
        test_list = in_test_list # [174:184]
    else: 
        test_list = testnames

    print("runnning the tests:", ', '.join(test_list))

    total_num_tests = len(test_list)
    globally_disbaled = 0
    execution_errors = outtxtmismatch_errors = resultcomparison_errors = 0
    asmsim_disabled = asmsim_execution_errors = 0
    unknown_errors = 0
    successes = 0

    for i, test in enumerate(test_list):
        os.chdir(cwd)
        print('\n')
        try:
            flag = runhwtests(test, fsim, asmsim, input_="hwtests")
            if flag == "FatalError":
                exit(0)
            if flag == "NotEnabledError":
                globally_disbaled += 1
                json_template["not enabled"].append(test)
            
            # if the test is enabled
            elif flag == "ExecutionError":
                execution_errors += 1
                json_template["fsim failing"]["ExecutionError"].append(test)
            elif flag == "OutTXTMistmatchError":
                outtxtmismatch_errors += 1
                json_template["fsim failing"]["OutTXTMistmatchError"].append(test)
            elif flag == "ResultComparisonError":
                resultcomparison_errors += 1
                json_template["fsim failing"]["ResultComparisonError"].append(test)
            
            # if none of above true, then fsim is passed
            elif flag == "AsmsimDisabled":
                asmsim_disabled += 1
                json_template["asmsim failing"][flag].append(test)
            elif flag == "AsmsimExecutionError":
                asmsim_execution_errors += 1
                json_template["asmsim failing"][flag].append(test)
            else:
                successes += 1
                json_template["successes"].append(test)
        except:
            flag = "UnknownError"
            unknown_errors += 1
            json_template["unknown error"].append(test)

        print(f"------------------------------ {i+1}/{total_num_tests} completed")
        
    # creating the output report
    fsim_failed = execution_errors + outtxtmismatch_errors + resultcomparison_errors
    asmsim_failed = asmsim_disabled + asmsim_execution_errors

    print("\n*****************************************************************************************************************************")
    print("total num of tests: %d" %total_num_tests)
    print("globally disbaled: %d out of %d" %(globally_disbaled, total_num_tests))
    print("fsim failed: %d out of %d" %(fsim_failed, total_num_tests))
    if fsim_failed:
        print(f"{tab}Execution Errors       : {execution_errors} out of {fsim_failed}")
        print(f"{tab}out.txt Mistmatch Error: {outtxtmismatch_errors} out of {fsim_failed}")
        print(f"{tab}Result Comparison Error: {resultcomparison_errors} out of {fsim_failed}")
    print("asmsim failed: %d out of %d" %(asmsim_failed, total_num_tests))
    if asmsim_failed:
        print(f"{tab}asmsim disabled: %d out of %d" %(asmsim_disabled, asmsim_failed))
        print(f"{tab}asmsim Execution Errors: %d out of %d" %(asmsim_execution_errors, asmsim_failed))
    print("unknown errors : %d out of %d" %(unknown_errors, total_num_tests))
    print("successful simulations: %d out of %d" %(successes, total_num_tests))

    print("current working dir: %s" %(os.getcwd()))
    # with open("testings_out/test_sim_status.json", 'w') as test_sim_status_file:
    #     json.dump(json_template, test_sim_status_file, indent=4)

# creating the sub parser for simulation 
parser = ArgumentParser(prog="simulate", description="simulate a test given in the specified input directory")
parser.add_argument("testnames", nargs='*', help="one or more tests (spcified by test name only) to simulate")
parser.add_argument('-f', "--fsim", action='store_false', help='when specified, fsim will be disabled on each of the input tests')
parser.add_argument('-a', "--asmsim", action='store_false', help='when specified, asmsim will be disabled on each of the input tests')
# parser.add_argument('-b', "--both", action='store_true', help='when specified, both fsim and asmsim will be run on each of the input tests')
# parser.add_argument('-i', "--input_dir", choices=["home", "hwtests"], default="home", help='indicates the directory from which the input test will be read')
args = parser.parse_args()

print(args)
# simulate(args.testnames, args.fsim, args.asmsim)

arr = []
for test in in_test_list:
    output_count = 0
    try:
        with open(hwtests_in_dir + test) as test_file:
            test_json = json.load(test_file)
    except:
        print("%s has an errorneous json spec file!!!" %(hwtests_in_dir + test))
        continue
    if "chips" in test_json:
        for chip in test_json["chips"]:
            for io_layer in chip["io_module"]["layers"]:
                if io_layer["layer_type"] == "output" or io_layer["layer_type"] == "output_ext":
                    output_count += 1
                if output_count > 1: 
                    arr.append(test.strip("-spec.json"))
                    break
    elif "io_module" in test_json:
        for io_layer in test_json["io_module"]["layers"]:
            if io_layer["layer_type"] == "output" or io_layer["layer_type"] == "output_ext":
                output_count += 1
            if output_count > 1: 
                arr.append(test.strip("-spec.json"))
                break
    else:
        pass

simulate(arr)