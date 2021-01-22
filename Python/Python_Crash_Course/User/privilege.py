# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

class Privilege:
    """A privilege class with one attribute."""

    def __init__(self):
        self.privileges = ""

    def show_privileges(self):
        """Displays privileges."""
        print(f"{self.privileges}")
