!!! copy standard input to standard output, skipping spaces
!!! R. Brown, 11/05

	_EXIT = 1
	_READ = 3
	_WRITE = 4
	_STDIN = 0
	_STDOUT = 1

	BUFFSIZE = 80
.SECT .TEXT
start:
	PUSH	endpr-prompt	! print prompt
	PUSH	prompt
	PUSH	_STDOUT		! on standard output
	PUSH	_WRITE
	SYS
	ADD		SP,8		! clean up stack

	PUSH	BUFFSIZE	! read input line
	PUSH	buff
	PUSH	_STDIN		! from standard input
	PUSH	_READ
	SYS
	ADD		SP,8		!clean up stack
	
	ADDB 	(buff), 32

	PUSH	endpr-lower
	PUSH	lower
	PUSH	_STDOUT
	PUSH	_WRITE
	SYS
	ADD 	SP,8

	PUSH	2
	PUSH	buff
	PUSH	_STDOUT
	PUSH	_WRITE
	SYS
	ADD 	SP,8

	PUSH	0			! normal exit status
	PUSH	_EXIT		! end program
	SYS

.SECT .DATA
prompt:	.ASCII "Enter an upper case letter: "
endpr:
lower:	 .ASCII "The lower-case equivilant is: "
size:	.WORD	0		! length of input

.SECT .BSS
buff:	.SPACE BUFFSIZE
endbuff: