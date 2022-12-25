#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

filename = 'programming.txt'
mode = 'a'

with open(filename, mode) as file_object:
    file_object.write("I love programming.\n")
    file_object.write("I love creating new games.\n")
