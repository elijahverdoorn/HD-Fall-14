print("n\tn!\n-----------")

def factorial(n):
    ans = 1
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
