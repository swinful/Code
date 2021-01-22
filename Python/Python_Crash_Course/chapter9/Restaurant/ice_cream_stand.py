# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

from restaurant import Restaurant


class IceCreamStand(Restaurant):
    """A type of restaurant."""

    def __init__(self, name, cuisine):
        """
        Initialize attributes of the parent class. Then initialize
        attributes specific to the Ice Cream Stand class.
        """
        super().__init__(name, cuisine)
        self.flavors = "chocolate, vanilla, strawberry"

    def describe_flavors(self):
        """Describes the flavors provided by our class."""
        print(f"We have the following flavors: {self.flavors}.")
