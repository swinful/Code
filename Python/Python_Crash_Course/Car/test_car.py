#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

from car import Car

my_new_car = Car('audi', 'a4', 2019)
print(my_new_car.get_descriptive_name())

my_new_car.odometer_reading = 23
my_new_car.read_odometer()

my_new_car.update_odometer(34)
my_new_car.read_odometer()

my_new_car.update_odometer(24)
my_new_car.read_odometer()

my_new_car.increment_odometer(100)
my_new_car.read_odometer()

my_new_car.increment_odometer(-10)
my_new_car.read_odometer()
