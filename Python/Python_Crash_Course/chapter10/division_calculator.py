#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

print("Give me two number, and I'll divide them.")
print("Enter 'q' to quit.")

while True:
    first_number = input("\nFirst number: ")

    if first_number == 'q':
        break

    second_number = input("Second number: ")
    if second_number == 'q':
        break

    answer = int(first_number) / int(second_number)
    print(answer)
