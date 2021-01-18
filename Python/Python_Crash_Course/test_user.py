#! /usr/bin/env python3
#
# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

from user import User

print("9-3: Users")
user1 = User("Samuel", "Winful")
user2 = User("Linda", "Winful")
user3 = User("David", "Winful")

user1.describe_user()
user1.greet_user()

user2.describe_user()
user2.greet_user()

user3.describe_user()
user3.greet_user()

print("9-5: Login Attempts")
new_user = User("Johnny", "Appleseed")
new_user.increment_login_attempts()
new_user.increment_login_attempts()
new_user.increment_login_attempts()
new_user.increment_login_attempts()
new_user.increment_login_attempts()
print(f"{new_user.first_name} logins: {new_user.login_attempts}")

new_user.reset_login_attempts()
print(f"{new_user.first_name} logins: {new_user.login_attempts}")
