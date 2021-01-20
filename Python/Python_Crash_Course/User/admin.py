# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL
from user import User


class Admin(User):
    """Admin class."""

    def __init__(self, first, last):
        """Default constructor."""
        super().__init__(first, last)
        self.privileges = "can add post, "
        self.privileges += "can delete post"

    def show_privileges(self):
        """Displays privileges."""
        print(f"{self.privileges}")
