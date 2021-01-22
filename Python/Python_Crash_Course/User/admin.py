# Reference: Python Crash Crouse, 2nd Edition
# Author: Samuel A WINFUL
from user import User
from privilege import Privilege


class Admin(User):
    """Admin class."""

    def __init__(self, first, last):
        """Default constructor."""
        super().__init__(first, last)
        self.privilege = Privilege()
        self.privilege.privileges += "can delete post"
