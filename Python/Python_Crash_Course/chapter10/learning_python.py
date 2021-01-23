#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

filename = 'learning_python.txt'

# Print contents by reading entire file in go.
with open(filename) as file_object:
    lines = file_object.read()
    print(f"{lines}\n---")


# Print contents by looping over the file object
with open(filename) as file_object:
    lines = file_object.readlines()

    for line in lines:
        print(f"{line.rstrip()}")

# Print contents by storing the lines in a list and then
#   working with them outside with the with block.
with open(filename) as file_object:
    lines = file_object.readlines()

print('\n---')
for line in lines:
    print(line.strip())
