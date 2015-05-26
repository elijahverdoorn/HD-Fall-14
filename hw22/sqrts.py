# print square roots in Python language.  R. Brown, 9/2010 

from math import sqrt
import sys
def function():
	if(len(sys.argv) < 1):
		print ('No!')
		return 1
	print("sqrt(n)\n--------")
	number = int(sys.argv[1])
	x = 0
	for x in range(0, number + 1):
	    print(sqrt(x))

function()