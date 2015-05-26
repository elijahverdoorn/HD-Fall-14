! Example assembly program
! RAB 11/05

        _EXIT   = 1             
        _READ   = 3             
        _WRITE  = 4             
        _STDIN  = 0             
        _STDOUT = 1             
.SECT .TEXT                     
start:  ! print prompt, as detailed in next five instructions
        PUSH    buff-prompt     ! third arg is length of prompt
        PUSH    prompt          ! second arg is address of prompt
        PUSH    _STDOUT         ! first arg is standard output
        PUSH    _WRITE          ! name of the OS function being called
        SYS                     ! perform the system call
        ADD     SP,8            ! clean up stack
                        
        PUSH    2               ! read two characters...
        PUSH    buff            ! into buff...
        PUSH    _STDIN          ! from standard input
        PUSH    _READ
        SYS
        ADD     SP,8            ! clean up stack
        PUSH    2               ! then print those characters
        PUSH    buff
        PUSH    _STDOUT         ! on standard output
        PUSH    _WRITE
        SYS
        ADD     SP,8            ! clean up stack

        PUSH    0               ! exit with normal exit status
        PUSH    _EXIT           
        SYS                     
        
.SECT .DATA                     
prompt:                         
.ASCII  "Type one character, then press ENTER:  "         
buff:   .SPACE	2
.SECT .BSS
