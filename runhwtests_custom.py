# a custom version of /home/akila/redo_project/sw_be/desgen/hwtests/runhwtests to run fsim and asmsim of a specified test using a function. 

import os
import sys
import shutil
import json
import argparse

from fsimfail import mismatch_check
tab = '\t'

def add_to_testdb(test_name):
    "add an entry to testdb.json if there exist none for the specified test"
    print("Sorry!!! the current test case is not available in testdb.json file. Fill in the data to add an entry for the test.")
    print("enter 'q' to exit")

    # creating a parser 
    testdb_parser = argparse.ArgumentParser()
    testdb_parser.add_argument("enabled", choices=[True, False], default=True)
    testdb_parser.add_argument("asm_test", choices=[True, False], default=True)
    testdb_parser.add_argument("dv_test", choices=[True, False], default=False)
    testdb_parser.add_argument("dv_tb", default="iss")
    testdb_parser.add_argument("asm_sim", choices=["simtop", "pull", "push", "asmsyspull_mchip", "asmsyspull_st"], default="simtop")
    testdb_parser.add_argument("neg_test", choices=[True, False], default=True)
    
    # taking the inputs from the user 
    entries = {"enabled" : True, "asm_test" : True, "dv_test" : False, "dv_tb": "iss", "asm_sim" : "simtop", "neg_test" : False}
    for entry in entries.keys():
        input("     %(entry)s (choices: [True, False])(recommended value ):")
    # ******** this is not complete yet ********* 

def verify_out(outTXT, simjson):
    "compare the output image dimensions in out.txt with sim.json specs to verify the correct fsim run of a test"
    # ******** this is not complete yet ********* 
    return True

def runasmsim(selected_test, home_dir, scmd, image_count, asmsys_test):
    "run asmsim for a single specified test"

    os.chdir(home_dir)
    simlog = home_dir + "/ASM_test/" + selected_test["name"] + "/"
    print(selected_test["name"] + ": Level 1 Passed, running " + selected_test["asm_sim"] + "...")                    
    if selected_test["asm_sim"] == "asmsyspull_mchip":
        stest_cmd = scmd + simlog + " > " + simlog + "/asmsystem.log" + " 2>&1"                                
    elif selected_test["asm_sim"] == "asmsyspull_st":
        stest_cmd = scmd + simlog + " " + str(image_count) + " > " + simlog + "/asmsystem.log" + " 2>&1" 
    elif selected_test["asm_sim"] == "pull":
        stest_cmd = scmd + simlog + " > " + simlog + "/asmsystem.log" + " 2>&1" 
    elif selected_test["asm_sim"] == "push":
        stest_cmd = scmd + simlog + " > " + simlog + "/asmsystem.log" + " 2>&1"                                        
    else:
        stest_cmd = scmd + simlog + " > " + simlog + "simtop.log" + " 2>&1"
    res3 = os.system(stest_cmd)
    if res3 == 0:
        # compare final results
        cmplog = home_dir + "/ASM_test/" + selected_test["name"] + "/asm_tst_diff.log"
        file1 = home_dir + "/ASM_test/" + selected_test["name"] + "/out.txt"
        file2 = home_dir + "/ASM_test/" + selected_test["name"] + "/asm_out.txt"
        os.system("mv asmlog*.txt" + " " + home_dir + "/ASM_test/" + selected_test["name"] + "/.")

        # clean the files for comparison
        os.system("grep -v --text Added " + file1 + " > " + file1 + ".clean")
        file1 = file1 + ".clean"
        #print("****** file 1 = " + file1)

        os.system("grep -v --text Added " + file2 + " > " + file2 + ".clean")
        file2 = file2 + ".clean"
        #print("****** file 2 = " + file2)
        #print("Doing diff: file1[" + file1 + "] file2[" + file2 + "]")

        cmp_cmd_3 = "diff " + file1 + " " + file2\
                    + " > " + cmplog + " 2>&1"

        res4 = os.system(cmp_cmd_3)

        if res4 == 0:                            
            if asmsys_test:
                print(selected_test["name"] + ": Asmsystem Passed")
            else:
                print(selected_test["name"] + ": Simtop passed")
        else:
            if asmsys_test:
                print(selected_test["name"] + ": Asmsystem Failed")
            else:
                print(selected_test["name"] + ": Simtop Failed")
            return "AsmsimExecutionError"
    else:
        if asmsys_test:
                print(selected_test["name"] + ": Asmsystem Failed")
        else:
                print(selected_test["name"] + ": Simtop Failed")               
        return "AsmsimExecutionError"

def runhwtests(test_name, fsim, asmsim, force_asmsim, vcd=False, input_="home"):
    "running fsim and asmsim (if specified) of a single test case"

    if vcd:
        print("Running vcd script!!!")
    else:
        print("Running without vcd script!!!") 

    #SHS
    proj_path = os.getenv('SW')
    # a custom version of /home/akila/redo_project/sw_be/desgen/hwtests/testdb.json 
    # will contain only few parameters compared to the original testdb.json 
    home_dir = os.getcwd()
    testdb_json_file = "testdb.json" # ****** change this later *******
    if proj_path != None:
        print("proj path problem")
        desgen_path = proj_path + "/desgen/hwtests"
        testdb_json_file = desgen_path + "/testdb.json"
        home_dir = desgen_path

    hwtests_dir = home_dir + "/../sw_be/desgen/hwtests"
    if input_ == "home": in_dir = home_dir + "/in/"
    elif input_ == "hwtests": in_dir = hwtests_dir + "/in/"
    
    home_ref_dir = home_dir + "/ref/"
    hwtests_ref_dir = hwtests_dir + "/ref/"
    
    cmd = home_dir + "/../sw_be/desgen/desgenhw "

    with open(testdb_json_file) as tf:
        testdb = json.load(tf)
    
    sim_json_file = in_dir + test_name + "-sim.json"
    spec_json_file = in_dir + test_name + "-spec.json"
    
    # pick the simulator based on test spec
    try: 
        selected_test = testdb[test_name]
    except KeyError: 
        print ("%s is not included in testdb.json" %test_name)
        return "FatalError"

    if selected_test["asm_sim"] == "asmsyspull_mchip": 
        asmsys_test = True           
        scmd = hwtests_dir + "/../../asmsystem/mchip_pull/" + selected_test["asm_sim"] + " "
    elif selected_test["asm_sim"] == "pull": 
        asmsys_test = True           
        scmd = hwtests_dir + "/../../asmsystem/pull/" + selected_test["asm_sim"] + " "   
    elif selected_test["asm_sim"] == "push": 
        asmsys_test = True           
        scmd = hwtests_dir + "/../../asmsystem/push/" + selected_test["asm_sim"] + " "       
    elif selected_test["asm_sim"] == "asmsyspull_st": 
        asmsys_test = True           
        scmd = hwtests_dir + "/../../asmsystem/pull_streaming/" + selected_test["asm_sim"] + " "    
    else:
        asmsys_test = False
        scmd = hwtests_dir + "/../../simtop/" + selected_test["asm_sim"] + " "                    

    # opening sim file (after checking in testdb.json)
    try:
        with open(sim_json_file) as simf:
            simjson = json.load(simf)
    except FileNotFoundError:
        print("%s has no sim json file")
        return "FatalError"
        
    # clean output artifacts before testing
    os.chdir(home_dir)

    if selected_test["enabled"] == True:
        print("Running test: " + selected_test["name"])

        # create following folders to store the results of fsim and asmsim simulations 
        shutil.rmtree(home_dir + "/ASM_test/" + selected_test["name"], True, None)
        os.mkdir(home_dir + "/ASM_test/" + selected_test["name"])
        os.chdir(home_dir + "/ASM_test/" + selected_test["name"])

        if selected_test["asm_test"] == True:
            shutil.rmtree(home_dir + "/ASM_test/" + selected_test["name"], True, None)
            os.mkdir(home_dir + "/ASM_test/" + selected_test["name"])
            os.chdir(home_dir + "/ASM_test/" + selected_test["name"])
        else:
            shutil.rmtree(home_dir + "/results/" + selected_test["name"], True, None)
            os.mkdir(home_dir + "/results/" + selected_test["name"])
            os.chdir(home_dir + "/results/" + selected_test["name"])

        print("Results Directory: " + os.getcwd())

        test_cmd = cmd + "--spec " + in_dir + selected_test["name"] + "-spec.json "\
                    + "--run " + in_dir + selected_test["name"] + "-sim.json"\
                    + " > " + selected_test["name"] + ".log 2>&1"                    
        res = os.system(test_cmd)

        if res != 0:
            print("Test " + selected_test["name"] + ": Execution Error") 
            return "ExecutionError"

        if "num_auto_images" in simjson:
            image_count = simjson["num_auto_images"]
        else:
            image_count = 1 

        # listing files used for verfications and validations 
        result_rpt      = home_dir + "/ASM_test/" + selected_test["name"] + "/map.rpt"
        home_ref_rpt    = home_ref_dir + selected_test["name"] + ".rpt"
        hwtests_ref_rpt = hwtests_ref_dir + selected_test["name"] + ".rpt"

        result_out      = [home_dir + "/ASM_test/" + selected_test["name"] + "/out.txt"]
        home_ref_out    = [home_ref_dir + selected_test["name"] + ".txt"]
        hwtests_ref_out = [hwtests_ref_dir + selected_test["name"] + ".txt"]
        for i in range(1, image_count):
            result_out.append(home_dir + "/ASM_test/" + selected_test["name"] + "/out" + str(i) + ".txt")
            home_ref_out.append(home_ref_dir + selected_test["name"] + "-" + str(i) + ".txt")
            hwtests_ref_out.append(hwtests_ref_dir + selected_test["name"] + "-" + str(i) + ".txt")

        if not verify_out(result_out, simjson):
            # verify whether output image dimensions in out.txt are compatible with those in sim.json 
            print("Test " + selected_test["name"] + ": Output Incorrect")
            return "OutTXTMistmatchError"
        
        # compare results if execution ok
        if not os.path.exists(home_ref_rpt):
            # if such a map.rpt does not exist in the home dir, search for a map.rpt in sw_be/desgen/hwtests/ref 
            print(f"{tab}reference reports could not be found in {home_ref_dir} \n{tab}searching for reference reports in {hwtests_ref_dir} ")

            if os.path.exists(hwtests_ref_rpt):
                # if the reports are found in hwtests, then verify it, and copy it to the home dir 
                print(f"{tab}reference reports were found")
                if not verify_out(hwtests_ref_out, simjson):
                    print(f"{tab}the reference map.rpt or out.txt found in {hwtests_ref_dir} may not comply with the sim.json file of this test\n{tab}{tab}exitting fsim!!!")
                    return "OutTXTMistmatchError" # ***
                print(f"{tab}copying reference reports into {home_ref_dir}")
                shutil.copy(hwtests_ref_rpt, home_ref_rpt)
                for i in range(image_count):
                    shutil.copy(hwtests_ref_out[i], home_ref_out[i])
                        
            else:
                # if the map.rpt does not exist either in hwtests or in home directories, 
                # by now, we know that the results are acceptable
                # so, get the map.rpt of the result as the ref map report 
                print(f"{tab}a reference map.rpt could not be found in {hwtests_ref_dir} as well\n{tab}{tab}taking the resulted map.rpt in {'fill in'} as the reference map.rpt!!!")
                shutil.copy(result_rpt, home_ref_rpt)
                for i in range(image_count):
                    shutil.copy(result_out[i], home_ref_out[i])

        cmp_cmd_1 = "diff map.rpt " + home_ref_dir + selected_test["name"] + ".rpt"\
                    + " > " + selected_test["name"] + ".rpt.log 2>&1"
        
        res1 = os.system(cmp_cmd_1)
        res5 = 0           

        for i in range(image_count):
            if i == 0:
                cmp_cmd_2 = "diff out.txt " + home_ref_dir + selected_test["name"] + ".txt"\
                    + " > " + selected_test["name"] + ".txt.log 2>&1"
                res2 = os.system(cmp_cmd_2)                            
            else:
                cmp_cmd_5 = "diff out" + str(i) + ".txt " + home_ref_dir + selected_test["name"] + "-" + str(i) + ".txt"\
                    + " > " + selected_test["name"] + "-" + str(i) + ".txt.log 2>&1"  
                res5 = res5 or os.system(cmp_cmd_5)                            
        
        # if fsim passed, 
        if res1 == 0 and res2 == 0 and res5 == 0:
            # if asmsim is enabled in testdb.json and user has specified to run asmsim
            if selected_test["asm_test"] == True and asmsim: 
                flag = runasmsim(selected_test, home_dir, scmd, image_count, asmsys_test)
                if flag != None: return flag 
            else:
                print(selected_test["name"] + ": Passed")
                print("asmsim for the test '%s' is either disabled in testdb.json or disabled by the user" %(selected_test["name"]))
                return "AsmsimDisabled"
        # if fsim has been failed due to ResultComparisonError 
        else:
            print(selected_test["name"] + ": Failed; the result may not be complying with the ref map.rpt or out.txt")
            # if asmsim has been forced by the user in case of a fsim-fail
            if force_asmsim: 
                print(f"{tab}asmsim has been forced by the user...")
                runasmsim(selected_test, home_dir, scmd, image_count, asmsys_test)
            return "ResultComparisonError"
    
    else: 
        print("%s: has not been enabled" %test_name)
        return "NotEnabledError"
    
    #Moving activity file to simtop and running vcd script for every test case
    activity_file_path = home_dir + "/activity.txt"
    if vcd == True:
        if os.path.isfile(activity_file_path):
            print("Activity file generated for {}".format(selected_test["name"]))
            os.system("mv -f {}/activity.txt {}/../../simtop/.".format(home_dir, home_dir))
            os.chdir("{}/../../simtop".format(home_dir))
            os.system("python3 vcd.py -i activity.txt -o {}_vcd.txt".format(selected_test["name"]))
            os.system("mv {}_vcd.txt {}/ASM_test/{}".format(selected_test["name"], home_dir, selected_test["name"]))
            os.chdir(home_dir)
        else:
            print("Activity file has not generated")    

    return "simSuccess"
