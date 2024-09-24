section .data
SYS_exit     equ 60                ; System call number for exit
EXIT_SUCCESS equ 0                 ; Exit status
num1         dw 0xFEDC             ; Declare 16-bit unsigned variable
num2         dw 0x1234             ; Declare 16-bit unsigned variable
sum          dd 0                  ; Declare 32-bit variable to hold result

section .text
    global _start          

_start:
	mov  ax, word[num1]               
    	add  ax, word[num2]              
	adc  dx, 0
	
	mov	[sum],ax
	mov	[sum+2], dx
	
	mov	rax, SYS_exit
    	mov  	rdi, EXIT_SUCCESS     
    	
    	syscall                       

