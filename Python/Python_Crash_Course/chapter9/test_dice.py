#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL
from dice import Die


def rolls(sides, rolls):
    new_die = Die(sides)
    for i in range(1, rolls):
        new_die.roll_die()


print("A 6-sided die, being rolled 10 times.")
rolls(6, 10)

print("\nA 10-sided die, being rolled 20 times.")
rolls(10, 20)
