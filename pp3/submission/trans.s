! Translation program, Programming Project 3
! Elijah Verdoorn, St. Olaf College
! CS241: Hardware Design, Fall 2014, Professor Brown

	_EXIT = 1
	_READ = 3
	_WRITE = 4
	_STDIN = 0
	_STDOUT = 1
	_GETCHAR = 117
	_STDERR = 2

	MAXBUFF = 80

.SECT .TEXT
	PUSH	26
	PUSH 	prompt1
	PUSH 	_STDOUT
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl 		! printing the prompt

	PUSH 	MAXBUFF
	PUSH	buff
	CALL	getline
	ADD		SP,4
	MOV 	BX,AX 	 		! getting the Translation key

	CMP 	BX,0
	JE 		2f				! ensuring that there were characters entered

	PUSH	buff
	CALL	gettrans
	ADD 	SP,2 			! putting the characters into inchar and outchar

	PUSH	29
	PUSH 	prompt2
	PUSH 	_STDOUT
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl 		! printing the prompt

! loop invar: inchar and outchar contain the character to look for and the character to replace it with
1:	PUSH 	MAXBUFF
	PUSH	buff
	CALL	getline
	ADD		SP,4
	MOV 	BX,AX			! getting a line to be translated

	CMP		BX,0
	JE 		2f 				! ensuring that there were characters entered

	PUSH 	buff
	CALL 	translate
	ADD 	SP,2 			! perform the translation

	PUSH 	BX
	PUSH	buff
	PUSH 	_STDOUT
	PUSH	_WRITE
	SYS
	ADD 	SP,8 			! print buff

	JMP 	1b 				! get the next line to be translated

! endloop
2:	CALL 	print_summary
	PUSH 	0				! 2 is the end of the program
	PUSH 	_EXIT
	SYS

! get a line of input
getline:
    PUSH    BX              ! save registers
    PUSH    BP
    MOV     BP,SP
    PUSH	DX
    PUSH	CX
    
    MOV     CX,0           	! Initialize counter
    MOV     BX,6(BP)        ! Save the starting address of the buffer
    MOV     DX,8(BP)        ! The max value the counter should reach
    SUB     DX,1

! loop invar: characters before the current character have been handled and characers after the current character are awaiting action
1:  CMP     DX,CX
    JE      2f              ! if read arg2 - 1 bytes, jmpto endloop
    PUSH    _GETCHAR
    SYS
    ADD     SP,2

    CMPB     AL,-1           ! if no character, jmpto endloop
    JE      2f
    MOVB    (BX),AL         ! store character in position BX
    INC     BX
    INC     CX

    CMPB    AL,'\n'
    JNE     1b

2:  ! endloop
	MOVB 	(BX),0
    MOV     AX,CX

    POP		CX
    POP 	DX
    POP     BP
    POP     BX	              ! restore registers		
    RET

! process the translation key	
gettrans:
	PUSH	BP
	PUSH 	BX
	PUSH 	CX
	MOV 	BP,SP

    MOV     BX,8(BP)        ! the arg is now in BX

	MOVB 	CL,(BX)
	MOVB 	(inchar), CL 	! move into inchar
	PUSH	inchar
	CALL	strlen			! getting the length of the string
	ADD 	SP,2
	CMP 	AX, 1
	JNE 	2f 				! jump and return failure

	ADD 	BX,2
	MOVB 	CL,(BX)
	MOVB 	(outchar), CL 	! moving into outchar
	PUSH	outchar 		! getting the length of the string
	CALL	strlen
	ADD 	SP,2
	CMP 	AX, 1
	JNE 	2f 				! jump and return failure

! endloop
1:	POP 	CX
	POP		BX
	POP		BP
	MOV 	AX,1
	RET 					 ! return with success exit status

! endloop
2:	POP 	CX
	POP		BX
	POP		BP
	MOV 	AX,0
	RET 					 ! return with faliure exit status

! perform the Translation
translate:
	PUSH 	BP
	PUSH	BX
	PUSH	CX
	MOV 	BP,SP
	PUSH 	DX

	MOV 	BX, 8(BP)

	MOV 	DX, (inword)

	! loop invar:  all occurences of inchar in buff before the character (BX) have been replaced by the character outchar
1:	CMPB 	(BX),0 				! is BX a nullbyte?
	JE 		4f 					! if so then quit loop

	PUSH 	BX
	CALL 	isspace
	ADD 	SP,2
	CMP 	AX, 1
	JNE		3f
	ADD 	(spacect), 1

3:	PUSH 	BX
	CALL 	ispunctuation
	ADD 	SP,2
	CMP 	AX, 1
	JNE		6f
	ADD 	(punctct), 1

6:	MOVB 	CL,(inchar)
	CMPB 	(BX), 65			! if BX is less than "A"
	JL 		9f
	CMPB 	(BX), 122 			! or if it is greater than "z"
	JG 		9f
	CMP 	DX, 0
	JNE 	8f
	ADD 	(wordct),1

8:	MOV 	DX, 1
	JMP 	5f

9: 	MOV 	DX, 0

5:	CMPB 	(BX), '\n'			! is the character a newline?
	JNE 	7f 					! if not then dont add to linecount
	ADD 	(linect),1			! incrementing the line count

7:	CMPB 	(BX), CL 			! BX ?= CL ?= inchar
	JNE 	2f 					! if the character should not be changed skip to 2
	MOVB	CL,(outchar)
	MOVB 	(BX),CL 			! replace character at BX with CL, return point from 6
	ADD 	(transct), 1 		! increment the translation count

2:	ADD 	(charct),1			! incrementing the character count
	INC 	BX 					! move to the next character
	JMP 	1b 					! go to the top of the loop

4:	! endloop
	MOV 	AX, BX
	MOV 	(inword), DX
	POP 	DX
	POP 	CX
	POP 	BX
	POP 	BP
	RET
! print the summary
print_summary:
	PUSH 	8
	PUSH 	summary
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl

	PUSH	(transct)
	PUSH	_STDOUT
	CALL 	printdec
	ADD 	SP,4 			! printing the character count

	PUSH 	13
	PUSH 	translations
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl

	PUSH 	(charct)
	PUSH	_STDOUT
	CALL 	printdec
	ADD 	SP,4 			! printing the translations count

	PUSH 	11
	PUSH 	characters
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl

	PUSH 	(wordct)
	PUSH	_STDOUT
	CALL 	printdec
	ADD 	SP,4 			! printing the word count

	PUSH 	6
	PUSH 	words
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL  	printnl

	PUSH 	(linect)
	PUSH	_STDOUT
	CALL 	printdec
	ADD 	SP,4 			! printing the line count

	PUSH 	6
	PUSH 	lines
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl

	PUSH 	(spacect)
	PUSH	_STDOUT
	CALL 	printdec
	ADD 	SP,4 			! printing the space count

	PUSH 	22
	PUSH 	whitespace
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl

	PUSH 	(punctct)
	PUSH	_STDOUT
	CALL 	printdec
	ADD 	SP,4 			! printing the punctuation count

	PUSH 	18
	PUSH 	punctuation
	PUSH 	_STDERR
	PUSH 	_WRITE
	SYS
	ADD 	SP,8
	CALL 	printnl

! check if the character is a whitespace character
isspace:
	PUSH	BP
	PUSH 	BX

	MOV 	BP,SP
	MOV		BX,6(BP)

	CMPB	(BX),32
	JE		7f

	CMPB	(BX),9
	JE		7f

	CMPB	(BX),10
	JE		7f

	CMPB	(BX),11
	JE		7f

	CMPB	(BX),12
	JE		7f

	CMPB 	(BX),13
	JE 		7f

	MOV 	AX,0
	POP 	BX
	POP		BP
	RET
	
7:	MOV 	AX,1
	POP 	BX
	POP		BP
	RET

! check if the character is a punctuation mark
ispunctuation:
	PUSH	BP
	PUSH 	BX

	MOV 	BP,SP
	MOV		BX,6(BP)

	CMPB	(BX),33
	JE		7f

	CMPB	(BX),39
	JE		7f

	CMPB	(BX),40
	JE		7f

	CMPB	(BX),41
	JE		7f

	CMPB	(BX),44
	JE		7f

	CMPB	(BX),45
	JE		7f

	CMPB 	(BX),46
	JE 		7f

	CMPB	(BX),47
	JE		7f

	CMPB 	(BX),58
	JE 		7f

	CMPB	(BX),59
	JE		7f

	CMPB 	(BX),63
	JE 		7f

	CMPB	(BX),96
	JE		7f

	MOV 	AX,0
	POP 	BX
	POP		BP
	RET
	
7:	MOV 	AX,1
	POP 	BX
	POP		BP
	RET
.SECT .DATA
	size:	.WORD	0		! length of input
	newline: .ASCII	"\n"
	nullb: .BYTE 0
	summary: .ASCII "Summary:" ! summary = 8 bytes
	characters: .ASCII " characters" ! characters = 11 bytes
	words: .ASCII " words" ! words = 6 bytes
	lines: .ASCII " lines" ! lines = 6 bytes
	translations: .ASCII " translations"
	prompt1: .ASCII "Enter the translation key:"
	prompt2: .ASCII "Enter lines to be translated:"
	whitespace: .ASCII " whitespace characters"
	punctuation: .ASCII " punctuation marks"

.SECT .BSS
	buff:	.SPACE MAXBUFF 	! the entire line of user input
	endbuff:
	inchar: .BYTE 0 		! the character to be replaced
	outchar: .BYTE 0 		! the character put in its place
	charct:	.WORD 0			! the number of characters
	wordct:	.WORD 0			! the number of words
	linect:	.WORD 0			! the number of lines
	inword: .WORD 0			! are we in a word?
	transct: .WORD 0 		! the number of translations
	spacect: .WORD 0 		! the number of spaces
	punctct: .WORD 0		! the number of punctuation marks
