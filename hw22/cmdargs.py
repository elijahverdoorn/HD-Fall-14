# Example of command-line arguments in Python3
# Prints any command-line arguments, one per line
# Usage: python3 cmdargs.py arg1 arg2 ...

import sys

for arg in sys.argv:
	print(arg)