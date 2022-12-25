#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

"""Read in each line from filename and replace the word Python
with the name of another language, 'C' as an example.
"""

filename = 'learning_python.txt'

with open(filename) as file_object:
    lines = file_object.readlines()

for line in lines:
    print(line.replace('Python', 'Tcl/Tk').rstrip())
