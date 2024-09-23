section .data
SYS_exit	equ	60
EXIT_SUCCESS	equ	0
num1	dw	0xFEDC		; Declare 16-bit variable (unsigned short)
num2 	dw 	0x1234         	; Declare 16-bit variable (unsigned short)
sum 	dd 	0               ; Declare 32-bit variable (unsigned int)

section .text
    global _start          

_start:
	; move num1 into AX(16 bits)
	mov 	ax, [num1]		;AX = 0xFEDC
	; add num2 to ax
	add 	ax, [num2]		;AX = 0xFEDC + 0x1234
	mov[sum], ax			;Store lower 16 bits of sum
	
						;mov word[sum], ax
        mov     rax, SYS_exit			;terminate excuting process
        mov     rdi, EXIT_SUCCESS		;exit status
        syscall					;calling system services

