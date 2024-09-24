section .data
    SYS_exit     equ 60         
    EXIT_SUCCESS equ 0        
    num1   dw 0x1234            
    num2   dw 0xFEDC           
    dif    dd 0                 
    
section .text
    global _start

_start:
	mov	eax, [num1]       
	sub	eax, [num2]   
	sbb	edx, 0       
	
	mov	dword[dif], eax
  	mov	dword[dif+2], edx
  	
    	mov	rax, SYS_exit          
    	mov	rdi, EXIT_SUCCESS       
    	syscall 	               
