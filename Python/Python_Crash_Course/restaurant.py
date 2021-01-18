# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

class Restaurant:
    """Basic restaurant class."""

    def __init__(self, restaurant_name, cuisine_type):
        self.name = restaurant_name
        self.cuisine_type = cuisine_type
        self.number_served = 0

    def increment_number_served(self, amount):
        """Increments the number of customers who have been served."""
        self.number_served += amount

    def set_number_served(self, amount):
        """Sets the number of customers served."""
        self.number_served = amount

    def describe_restaurant(self):
        """Describes a restaurant."""
        print(f"Restaurant Name: {self.name}")
        print(f"Cuisine Type: {self.cuisine_type}")

    def open_restaurant(self):
        """Prints message indicating the restaurant is open."""
        print("We're Open!")
