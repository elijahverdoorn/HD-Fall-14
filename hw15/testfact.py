def factorial(par):
	returner = 0
	if par == 0:
		return 1
	else:
		returner = par * factorial(par - 1)
		return returner


print("factorial(n)")
print("-------------------")
print(factorial(10))