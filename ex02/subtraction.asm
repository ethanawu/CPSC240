section .data
    SYS_exit     equ 60         ; System call number for exit
    EXIT_SUCCESS equ 0          ; Exit status
    num1   dw 0x1234            ; Declare 16-bit signed variable (0x1234)
    num2   dw 0xFEDC            ; Declare 16-bit signed variable (0xFEDC)
    dif    dd 0                 ; Declare 32-bit variable (to store the difference)
    
section .text
    global _start

_start:
	mov ax, word[num1]             
	sub ax, word[num2]   
	adc dx, 0       
	
	mov	[dif], ax
  	mov	[dif+2], dx
  	
    	mov rax, SYS_exit           ; Exit system call number
    	mov rdi, EXIT_SUCCESS       ; Exit status
    	syscall                     ; Call kernel

