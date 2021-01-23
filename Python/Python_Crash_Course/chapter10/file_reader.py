#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

# Reading an entire file all at once
with open('pi_digits.txt') as file_object:
    contents = file_object.read()

print(contents.rstrip())


# Reading a file line by line.
filename = 'pi_digits.txt'

with open(filename) as file_object:
    lines = file_object.readlines()

pi_string = ''
for line in lines:
    pi_string += line.strip()

print(pi_string)
print(len(pi_string))
