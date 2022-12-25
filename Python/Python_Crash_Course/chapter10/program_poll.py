#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

filename = 'program_poll.txt'

with open(filename, 'w') as fileHandle:
    while True:
        response = input("Reason you like programming? ")
        fileHandle.write(f"{response}\n")
