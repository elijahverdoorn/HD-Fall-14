ans = 1

print("n\tn!\n-----------")

def resetans():
    ans = 1

def factorial(n):
    resetans()
    if n < 1:
        return ans
    else:
        return n * factorial(n-1)

n = 0
while n < 6:
    print(n, end='\t')
    print(factorial(n))
    print()
    n = n + 1
