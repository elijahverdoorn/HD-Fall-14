#Hamming Code Project, Elijah Verdoorn, 10/6/14#

#for sys.exit
import sys

def hamming8(par):
	temp = 0 #used to hold a value to be written to the array
	tempArray = [0]#the array of values
	doneOnce = 0 #if the iteration has been done once
	for x in range (0, 8):
		temp = (par >> x) & 1 #getting the next bit
		#writing to the array
		if doneOnce == 0:
			tempArray [0] = temp
			doneOnce = 1
		else:
			tempArray.extend([temp])
	#flip the array
	tempArray.reverse()
	hammingArray = [] #21 index array
	count = 0 #keep track of the position in tempArray
	for x in range (0, 12):
		if x == 0 or x == 1 or x == 3 or x == 7:
			#insert 0 for all the parity bits
			hammingArray.append(0)
		else:
			#insert the data bits
			hammingArray.append(tempArray [count])
			count = count + 1
	#calculate the parity bits
	parity1 = 0
	parity2 = 0
	parity3 = 0
	parity4 = 0
	for x in range (0, 12):
		if x % 2 == 0:
			parity1 += hammingArray[x]
		if x == 1 or x == 2 or x == 5 or x == 6 or x == 9 or x == 10:
			parity2 += hammingArray[x]
		if x == 3 or x == 4 or x == 5 or x == 6 or x == 11:
			parity3 += hammingArray[x]
		if 6 < x < 12:
			parity4 += hammingArray[x]
	hammingArray[0] = parity1 % 2
	hammingArray[1] = parity2 % 2
	hammingArray[3] = parity3 % 2
	hammingArray[7] = parity4 % 2
	#put hammingArray into an int
	returner = '0'
	doneOnce = 0
	for x in range (0,12):
		if doneOnce == 0:
			returner = str(hammingArray[x])
			doneOnce = 1
		else:
			returner += str(hammingArray[x])
	#returning a value
	return returner

def hamming16 (par):
	temp = 0 #used to hold a value to be written to the array
	tempArray = [0]#the array of values
	doneOnce = 0 #if the iteration has been done once
	for x in range (0, 16):
		temp = (par >> x) & 1 #getting the next bit
		#writing to the array
		if doneOnce == 0:
			tempArray [0] = temp
			doneOnce = 1
		else:
			tempArray.extend([temp])
	#flip the array
	tempArray.reverse()
	hammingArray = [] #21 index array
	count = 0 #keep track of the position in tempArray

	for x in range (0, 21):
		if x == 0 or x == 1 or x == 3 or x == 7 or x == 15:
			#insert 0 for all the parity bits
			hammingArray.append(0)
		else:
			#insert the data bits
			hammingArray.append(tempArray [count])
			count = count + 1
	#calculate the parity bits
	parity1 = 0
	parity2 = 0
	parity3 = 0
	parity4 = 0
	parity5 = 0
	for x in range (0, 21):
		if x % 2 == 0:
			parity1 += hammingArray[x]
		if x == 1 or x == 2 or x == 5 or x == 6 or x == 9 or x == 10 or x == 13 or x == 14 or x == 17 or x == 18:
			parity2 += hammingArray[x]
		if x == 3 or x == 4 or x == 5 or x == 6 or x == 11 or x == 12 or x == 13 or x == 14 or x == 19 or x == 20:
			parity3 += hammingArray[x]
		if 6 < x < 15:
			parity4 += hammingArray[x]
		if x >= 16:
			parity5 += hammingArray[x]
	hammingArray[0] = parity1 % 2
	hammingArray[1] = parity2 % 2
	hammingArray[3] = parity3 % 2
	hammingArray[7] = parity4 % 2
	hammingArray[15] = parity5 % 2
	#put hammingArray into an int
	returner = '0'
	doneOnce = 0
	for x in range (0,21):
		if doneOnce == 0:
			returner = str(hammingArray[x])
			doneOnce = 1
		else:
			returner += str(hammingArray[x])
	#returning a value
	return returner

def hammingMain():
	#getting user input
	strOut = 1
	strNumberCheck = input("Evaluate a 16-bit hexadecimal value? (Y/N)")
	if strNumberCheck == "quit":
		sys.exit("Quitting.")
	else:
		if strNumberCheck == "Y" or strNumberCheck == "y":
			strIn = input("Please enter a 16-bit hexadecimal value:  ")
			#ensuring that it is of length 4
			if len(strIn) != 4:
				print("You did not enter a 16-bit value!  Restarting.")
				hammingMain()
			#converting to an int
			val = int(strIn, 16)
			strOut = hamming16(val)
		else:
			strNumberCheck = input("Evaluate an 8 bit hexadecimal value? (Y/N)")
			if strNumberCheck == "quit":
				sys.exit("Quitting.")
			else:
				if strNumberCheck == "Y" or strNumberCheck == "y":
					strIn = input("Please enter an 8-bit hexadecimal value:  ")
					if len(strIn) != 2:
						println("You did not enter 2 digits!  Restarting.")
						hammingMain()
					#converting to an int
					val = int(strIn, 16)
					strOut = hamming8(val)
				else:
					strNumberCheck = input("Evaluate a 32 bit hexadecimal value? (Y/N)")
					if strNumberCheck == "quit":
						sys.exit("Quitting.")
					else:
						if strNumberCheck == "Y" or strNumberCheck == "y":
							strIn = input("Please enter a 32-bit hexadecimal value:  ")
							if len(strIn) != 8:
								println("You did not enter 8 digits!  Restarting.")
								hammingMain()
							#converting to an int
							val = int(strIn, 16)
							strOut = hamming32(val)
						else:
							strNumberCheck = input("That is all the program can do. Restart? (Y/N)")
							if strNumberCheck == "Y" or strNumberCheck == "y":
								hammingMain()
							else:
								sys.exit("Quitting.")
	strHex = '%0*X' % ((len(strOut) + 3) // 4, int(strOut, 2))
	print('The hexadecimal representation of the Hamming Code is: ' + strHex)


#inform the user
print("Welcome to Hamming Calculator!")
print("This program was written by Elijah Verdoorn for CS 241 at St. Olaf College.")
print("The program will evaluate hamming codes for various inputs.")
print("To quit, enter 'quit' at any of the prompts and the program will terminate.")
#run the program
hammingMain()