# Example Python program using hexadecimal input/output
# RAB 9/10 

str = input("Please enter a 4-digit hexadecimal value:  ")

if len(str) != 4:
    println("You did not enter four digits!  Aborting.")
    sys.exit()
# str holds a string of length 4

val = int(str, 16)

print("Decimal:      ", val) # default is to produce decimal string for output
print("Hexadecimal:  ", hex(val))