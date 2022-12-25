#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

"""Ask the user for their name and write it to guest.txt"""
filename = 'guest.txt'
mode = 'w'

with open(filename, mode) as file_object:
    response = input("What is your name? ")
    file_object.write(response)
