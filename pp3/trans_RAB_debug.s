! Translation program, Programming Project 3
! Elijah Verdoorn, St. Olaf College
! CS241: Hardware Design, Fall 2014, Professor Brown

	_EXIT = 1
	_READ = 3
	_WRITE = 4
	_STDIN = 0
	_STDOUT = 1
	_GETCHAR = 117

	MAXBUFF = 80

.SECT .TEXT
	! Initialize variables, this does not work yet todo: fix this
	MOV 	(charct),0
	MOV 	(wordct),0
	MOV 	(linect),0

!	PUSH 	MAXBUFF		! DEBUG
!	PUSH	buff
!	CALL	getline
!	ADD		SP,4
!
!	MOV	CX,AX
!
!	PUSH	AX		! DEBUG
!	PUSH	buff
!	PUSH	_STDOUT
!	PUSH	_WRITE
!	SYS
!	ADD	SP,8
!
!.SECT .DATA
!rab:	.BYTE	'X'
!.SECT .TEXT
!
!	PUSH 	1
!	PUSH	rab
!	PUSH 	_STDOUT
!	PUSH	_WRITE
!	SYS
!	ADD 	SP,8
!
!	PUSH	CX		! DEBUG
!	PUSH	_EXIT
!	SYS


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
	!MOV 	(buff),AX		! move the translated line to buff

	PUSH 	BX
	PUSH	buff
	PUSH 	_STDOUT
	PUSH	_WRITE
	SYS
	ADD 	SP,8 			! print buff

	MOV	SI,AX			! RAB TWEAK

	JMP 	1b 				! get the next line to be translated

2:	PUSH 	SI		! 2 is the end of the program RAB TWEAK
	PUSH 	_EXIT
	SYS

getline:
    PUSH    BX              ! save registers
    PUSH    BP
    MOV     BP,SP
    
    MOV     CX,0           	! Initialize counter
    MOV     BX,6(BP)        ! Save the starting address of the buffer
    MOV     DX,8(BP)        ! The max value the counter should reach
    SUB     DX,1

1:  CMP     DX,CX
    JE      2f              ! if read arg2 - 1 bytes, jmpto endloop
    PUSH    _GETCHAR
    SYS
    ADD     SP,2

    CMPB    AL,-1           ! if no character, jmpto endloop
    JE      2f
    MOVB    (BX),AL         ! store character in position BX
!	ADDB	(BX),32		! DEBUG

!	ADDB	(BX), 32    ! DEBUG
!	PUSH 	1
!	PUSH	BX
!	PUSH 	_STDOUT
!	PUSH	_WRITE
!	SYS
!	ADD 	SP,8

 			! print buff
	

    INC     BX
    INC     CX

    CMPB    AL,'\n'
    JNE     1b

2:  ! endloop
    MOVB    (BX),0
    MOV     AX,CX

    POP     BP              !restore registers
    POP     BX
    RET
	
gettrans: 					! todo: check if the string comparison works 
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


1:	POP 	CX
	POP		BX
	POP		BP
	MOV 	AX,1
	RET 					 ! return with success exit status

2:	POP 	CX
	POP		BX
	POP		BP
	MOV 	AX,0
	RET 					 ! return with faliure exit status

translate:
	PUSH 	BP
	PUSH	BX
	PUSH	CX
	MOV 	BP,SP

	MOV 	BX, 8(BP)

	! loop invar:  all occurences of inchar in buff before the character (BX) have been replaced by the character outchar
1:	CMPB 	(BX),0 				! is BX a nullbyte?
	JE 		3f 					! if so then quit loop
	MOVB 	CL,(inchar)
	CMPB 	(BX), CL 			! BX ?= CL ?= inchar
	JNE 	2f 					! if the character should not be changed skip to 2
	MOVB	CL,(outchar)
	MOVB 	(BX),CL 			! replace character at BX with CL
2:	INC 	BX
	INC 	(charct)
	JMP 	1b

3:	! endloop
	MOV 	AX, BX
	POP 	CX
	POP 	BX
	POP 	BP
	RET

.SECT .DATA
	dummy: .ASCII "testing"	! todo: remove me before submitting, for testing only
	prompt:	.ASCII "Enter one line of input: "
	endpr:
	size:	.WORD	0		! length of input
	newline: .ASCII	"/n"
	nullb: .BYTE 0
.SECT .BSS
	buff:	.SPACE MAXBUFF 	! the entire line of user input
	endbuff:
	inchar: .BYTE 0 		! the character to be replaced
	outchar: .BYTE 0 		! the character put in its place
	charct:	.WORD 0			! the number of characters
	wordct:	.WORD 0			! the number of words
	linect:	.WORD 0			! the number of lines
