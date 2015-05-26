print("n\tn!\n-----------")

def factorial(n):
    ans = 1
    if n < 1:
        return ans
    else:
        return n * factorial(n-1)

for n in range (0, 6):
    print(n, end='\t')
    print(factorial(n))
    print()
