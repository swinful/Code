#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

from restaurant import Restaurant

print("\n===>>> 9-1: Restaurant")
restaurant = Restaurant('Taco Bell', 'Tacos')

print(f"Restaurant name: {restaurant.name}")
print(f"Cuisine Type: {restaurant.cuisine_type}")


print("\n===>>> 9-2: Three Restaurants")
restaurant1 = Restaurant("Olive Garden", "Italian")
restaurant2 = Restaurant("TGI Friday's", "American")
restaurant3 = Restaurant("Carribean Specialties", "Carribean")

restaurant1.describe_restaurant()
restaurant2.describe_restaurant()
restaurant3.describe_restaurant()


print("\n===>>> 9-4: Number Served")
print(f"{restaurant1.name} has served {restaurant1.number_served} customers.")
restaurant1.number_served = 3
print(f"{restaurant1.name} has served {restaurant1.number_served} customers.")

restaurant1.set_number_served(30)
print(f"{restaurant1.name} has served {restaurant1.number_served} customers.")

restaurant1.increment_number_served(100)
print(f"{restaurant1.name} has served {restaurant1.number_served} customers.")
