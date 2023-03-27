
AUTOMATIC TEST GENERATION 

The objective of the Automatic Test Generation is to create the sim and spec json files of the tests by using a small-size json file that contains only the main specifications, so that creating 
new tests does not require going through and changing lengthy parameter lists, thus the process become easier. 

* in order to simulate some test cases using the 'simulation.py' script, you have to have a copy of 'sw_be/desgen/hwtests/qmodels' folder in the same directory as the script, othewise the 
  simulation may terminate raising an fsim exectuion error. If this doesn't seem to remove this error, try pasting 'sw_be/desgen/hwtests/data' folder as well.