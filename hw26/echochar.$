! Example assembly program
! RAB 11/05
_EXIT = 1
_READ = 3
_WRITE = 4
_STDIN = 0
_STDOUT = 1
.SECT .TEXT
start: ! print prompt, as detailed in next five instructions
PUSH buff-prompt ! third arg is length of prompt
PUSH prompt ! second arg is address of prompt
PUSH _STDOUT ! first arg is standard output
PUSH _WRITE ! name of the OS function being called
SYS ! perform the system call
ADD SP,8 ! clean up stack
1: PUSH 1 ! read one character...
PUSH buff ! into buff...
PUSH _STDIN ! from standard input
PUSH _READ
SYS
ADD SP,8 ! clean up stack
CMPB (buff),'\n' ! if input char isn't a newline...
JE 9f
PUSH 2 ! then print input char and newline
PUSH buff
PUSH _STDOUT ! on standard output
PUSH _WRITE
SYS
ADD SP,8 ! clean up stack
JMP 1b ! and go back for another input char
9: PUSH 0 ! exit with normal exit status
PUSH _EXIT
SYS
.SECT .DATA
prompt:
.ASCII "Enter a line of characters: "
buff: .BYTE 0
.BYTE 10
.SECT .BSS
