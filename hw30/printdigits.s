!!! Print only the digits of lines of standard input
!!! Example of nested loop, use of SI and DI registers, and checking for
!!!  a range of ASCII codes '0' <= (SI) <= '9' 
!!! RAB 11/05

        _EXIT   = 1             
        _READ   = 3             
        _WRITE  = 4             
        _STDIN  = 0             
        _STDOUT = 1             

	BUFFSIZE = 100

.SECT .TEXT                     
start:  ! print prompt, as detailed in next five instructions
        PUSH    endpr-prompt    ! third arg is length of prompt
        PUSH    prompt          ! second arg is address of prompt
        PUSH    _STDOUT         ! first arg is standard output
        PUSH    _WRITE          ! name of the OS function being called
        SYS                     ! perform the system call
	ADD	SP,8		! clean up stack

	!! invar: digits of all prior lines have been printed
1:      PUSH    BUFFSIZE        ! read one line...
        PUSH    inbuff          ! into inbuff...
        PUSH    _STDIN          ! from standard input
        PUSH    _READ
        SYS
	ADD	SP,8		! clean up stack

	!! assert -- AX holds number of bytes that were read
	CMPB	(inbuff),'\n'	! if new input line is not empty...
	JE	9f
	MOV	BX,inbuff	! add a nullbyte...
	ADD	BX,AX		!
	MOV	(BX),0		! to end of input
	
	MOV	SI,inbuff	! initialize for inner loop
	MOV	DI,outbuff
	!! invar for inner loop: 
	!!  all digits of inbuff before SI have been copied to outbuff AND
	!!  DI holds address of first empty location in outbuff
2:	CMPB	(SI),0		! if next char is not nullbyte
	JE	5f		! then exit inner loop
	CMPB	(SI),'0'	! if next char is a digit...
	JL	3f
	CMPB	(SI),'9'
	JG	3f
	MOVB	AL,(SI)		! then copy that char to next byte of outbuff
	MOVB	(DI),AL	
        INC	DI		! and update DI
3:	INC	SI		! whether a digit or not, update SI
        JMP     2b              ! and go back for another char of inbuff

5:	!! assert: outbuff holds the digits of the entire line in inbuff AND
	!!  DI holds address of first empty location in outbuff
	MOV	(DI),'\n'	! add a newline to end of outbuff
	INC	DI
	SUB	DI,outbuff	! assign length of outbuff (incl newline) to DI
	PUSH	DI		! print outbuff
	PUSH	outbuff
	PUSH	_STDOUT		! on standard output
	PUSH	_WRITE
        SYS
	ADD	SP,8		! clean up stack
	JMP	1b		! go back for another line
        
9:      PUSH    0               ! exit with normal exit status
        PUSH    _EXIT           
        SYS                     
        
.SECT .DATA                     
prompt:                         
.ASCII  "Enter lines of characters, terminated by an empty line\n"
endpr:	
.SECT .BSS
inbuff:	.SPACE	BUFFSIZE
outbuff:
	.SPACE	BUFFSIZE