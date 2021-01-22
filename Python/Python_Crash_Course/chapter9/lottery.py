#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

from random import choice

number_list = ['10', '5', '3', '1', '20', '15', '18', '30']
letter_list = ['a', 'z', 'c', 'e', 'g']


def get_winning_numbers():
    winning_numbers = []

    for i in range(8):
        winning_numbers.append(choice(number_list))
    return(winning_numbers)


# Select four random numbers
winning_numbers = get_winning_numbers()

# 9-14: Lottery
print(f"Winning numbers: {winning_numbers}")

# 9-15: Lottery Analysis
my_ticket = get_winning_numbers()

count = 0
while my_ticket != get_winning_numbers():
    count += 1

print(f"found: {my_ticket} in {count} tries!")
