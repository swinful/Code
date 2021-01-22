# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

class Battery:
    """A simple battery class."""

    def __init__(self, battery_size=75):
        """Initialize the batter's attribute."""
        self.battery_size = battery_size

    def describe_battery(self):
        """Describe the battery size."""
        print(f"This car has a {self.battery_size}-kWh battery.")

    def get_range(self):
        """Print a statement about the range this battery provides."""
        if self.battery_size == 75:
            range = 260
        elif self.battery_size == 100:
            range = 315

        print(f"This car can go about {range} miles on a full charge.")
