# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

from random import randint


class Die:
    """Die Class."""

    def __init__(self, size=6):
        """Default number of sides."""
        self.sides = size

    def roll_die(self):
        """
        Print random number between 1 and number of sides
        on the die.
        """
        print(randint(1, self.sides))
