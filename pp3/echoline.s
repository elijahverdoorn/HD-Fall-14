	_EXIT = 1
	_READ = 3
	_WRITE = 4
	_STDIN = 0
	_STDOUT = 1
	_GETCHAR = 117

	MAXBUFF = 80

.SECT .TEXT
start:
	PUSH	endpr-prompt	! print prompt
	PUSH	prompt
	PUSH	_STDOUT		! on standard output
	PUSH	_WRITE
	SYS
	ADD		SP,8		! clean up stack

	PUSH 	buff
	PUSH	MAXBUFF
	CALL	getline
	ADD		SP,4
	MOV 	BX,AX

	PUSH 	BX
	PUSH	buff
	PUSH 	_STDOUT
	PUSH	_WRITE
	SYS
	ADD 	SP,8

	PUSH 	0
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

1:      CMP     DX,CX
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

2:      ! endloop
        MOVB    CL,(nullb)
        MOVB    (BX),CL
        MOV     AX,BX
        SUB     AX,8(BP)

        POP     BP              !restore registers
        POP     BX
        RET
	
.SECT .DATA
	prompt:	.ASCII "Enter one line of input: "
	endpr:
	size:	.WORD	0		! length of input
	newline: .ASCII	"/n"
	nullb: .BYTE 0
.SECT .BSS
	buff:	.SPACE MAXBUFF
	endbuff: