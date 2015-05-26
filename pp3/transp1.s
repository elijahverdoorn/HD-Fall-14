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
start:
	PUSH 	buff
	PUSH	MAXBUFF
	CALL	getline
	ADD		SP,4
	MOV 	BX,AX

	CMP 	BX,0
	JE 		2f

	PUSH	buff
	CALL	gettrans
	ADD 	SP,2

	PUSH	1
	PUSH	inchar
	PUSH 	_STDOUT
	PUSH 	_WRITE
	SYS
	ADD 	SP,4

	CALL	printnl

	PUSH 	1
	PUSH	outchar
	PUSH 	_STDOUT
	PUSH	_WRITE
	SYS
	ADD 	SP,4

	CALL	printnl

! this works up to step 4
!1:	PUSH 	buff
!	PUSH	MAXBUFF
!	CALL	getline
!	ADD		SP,4
!	MOV 	BX,AX

!	CMP		BX,0
!	JE 		2f

!	PUSH 	BX
!	PUSH	buff
!	PUSH 	_STDOUT
!	PUSH	_WRITE
!	SYS
!	ADD 	SP,8

!	JMP 	1b

2:	PUSH 	0				! 2 is the end of the program
	PUSH 	_EXIT
	SYS

getline:
    PUSH    BX              ! save registers
    PUSH    BP
    MOV     BP,SP
    
    MOV     CX,0           	! Initialize counter
    MOV     BX,8(BP)        ! Save the starting address of the buffer
    MOV     DX,6(BP)        ! The max value the counter should reach
    SUB     DX,1

1:  CMP     DX,CX
    JE      2f              ! if read arg2 - 1 bytes, jmpto endloop
    PUSH    _GETCHAR
    SYS
    ADD     SP,2

    CMP     AX,-1           ! if no character, jmpto endloop
    JE      2f
    MOVB    (BX),AL         ! store character in position BX
    INC     BX
    INC     CX

    CMP     AX,'\n'
    JNE     1b

2:  ! endloop
    MOVB    CL,(nullb)
    MOVB    (BX),CL
    MOV     AX,BX
    SUB     AX,8(BP)

    POP     BP              !restore registers
    POP     BX
    RET
	
gettrans:
	PUSH	BP
	PUSH 	BX
	PUSH 	CX
	MOV 	BP,SP

    MOV     BX,8(BP)        ! the arg is now in BX

	MOVB 	CL,(BX)
	MOVB 	(inchar), CL
	ADD 	BX,2
	MOVB 	CL,(BX)
	MOVB 	(outchar), CL

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

.SECT .DATA
	dummy: .ASCII "dummy"
	prompt:	.ASCII "Enter one line of input: "
	endpr:
	size:	.WORD	0		! length of input
	newline: .ASCII	"/n"
	nullb: .BYTE 0
.SECT .BSS
	buff:	.SPACE MAXBUFF
	endbuff:
	inchar: .BYTE 0
	outchar: .BYTE 0