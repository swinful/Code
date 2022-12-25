#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

"""Prompt users for their name. WHen they enter their name,
print a greeting to the screen and add a line recording their
visit in a file called guest_book.txt."""

filename = 'guest_book.txt'
mode = 'w'

with open(filename, mode) as file_object:
    while True:
        name = input("What is your name? ")
        print(f"Hello {name}!")
        file_object.write(f"{name}\n")
