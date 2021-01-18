# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL

class User:
    """User class."""

    def __init__(self, first, last):
        self.first_name = first
        self.last_name = last
        self.email = None
        self.username = None
        self.login_attempts = 0

    def reset_login_attempts(self):
        """Resets login attempts to zero."""
        self.login_attempts = 0

    def increment_login_attempts(self):
        """Increment login attempts by 1."""
        self.login_attempts += 1

    def describe_user(self):
        """Print summary of user."""
        print(f"Name: {self.first_name} {self.last_name}")
        print(f"Email: {self.email}")
        print(f"Username: {self.username}")

    def greet_user(self):
        """Prints a personalized greeting to the user."""
        print(f"Hello {self.first_name} {self.last_name}!")
