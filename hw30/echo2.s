!!! copy standard input to standard output, replace all CAPS with lowers
!!! E. Verdoorn, 11/20/14

	_EXIT = 1
	_READ = 3
	_WRITE = 4
	_STDIN = 0
	_STDOUT = 1

	BUFFSIZE = 160

.SECT .TEXT
start:
	PUSH	size-prompt			! print prompt
	PUSH	prompt
	PUSH	_STDOUT				! on standard output
	PUSH	_WRITE
	SYS
	ADD		SP,8				! clean up stack

1:	PUSH	BUFFSIZE
	PUSH	inbuff
	PUSH	_STDIN
	PUSH	_READ
	SYS
	ADD		SP,8
	MOV		CX, size-inbuff		! for loop control
	! pasted from printdigits.s
	CMPB	(inbuff),'\n'		! if new input line is not empty
	JE		9f
	MOV		BX,inbuff			! add a nullbyte
	ADD		BX,AX
	MOV		(BX),0				! to end of input
	! end paste
	MOV		SI, inbuff
	MOV		DI, outbuff

3:	CMPB	(SI), 0				! top of the loop
	JE		5f
	CMPB	(SI), 65
	JL		4f
	CMPB	(SI), 90
	JG		4f
	ADD		(SI), 32

4:	MOVB	AL, (SI)
	MOVB	(DI), AL
	INC		DI
	INC 	SI
	JMP 	3b

5:	INC	DI
	SUB	DI,outbuff				! assign length of outbuff (incl newline) to DI
	PUSH	DI					! print outbuff
	PUSH	outbuff
	PUSH	_STDOUT				! on standard output
	PUSH	_WRITE
    SYS
	ADD	SP,8					! clean up stack

9: 	PUSH    0               	! exit with normal exit status
	PUSH    _EXIT           
	SYS  

.SECT .DATA
prompt:	.ASCII "Enter an Phrase: \n"
size:	.WORD	0				! length of input
newline:	.ASCII "\n"
inbuff:	.SPACE BUFFSIZE
outbuff: .SPACE BUFFSIZE
.SECT .BSS