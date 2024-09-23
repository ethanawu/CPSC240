section .data
    SYS_exit     equ 60         ; System call number for exit
    EXIT_SUCCESS equ 0          ; Exit status
    num1   dw 0x1234            ; Declare 16-bit signed variable (0x1234)
    num2   dw 0xFEDC            ; Declare 16-bit signed variable (0xFEDC)
    dif    dd 0                 ; Declare 32-bit variable (to store the difference)
    
section .text
    global _start

_start:
    ; Load num1 into AX (16-bit register)
    mov ax, [num1]              ; AX = 0x1234
    
    ; Subtract num2 from AX
    sub ax, [num2]              ; AX = num1 - num2 (0x1234 - 0xFEDC)
    
    ; Store the result (lower 16 bits) into dif
    mov [dif], ax               ; Store result in dif (lower 16 bits)
    
    ; Handle the sign extension for 32-bit result
    ; If the result is negative, the carry flag will be set
    ; Here, we need to handle the sign extension
    movzx eax, word [dif]       ; Zero-extend 16-bit result to 32-bit in EAX
    sub eax, 0x8000             ; Convert to signed by subtracting 0x8000 if result was negative
    
    ; Store the final result in dif
    mov [dif], eax              ; Store the 32-bit result in dif

    ; Exit the program
    mov rax, SYS_exit           ; Exit system call number
    mov rdi, EXIT_SUCCESS       ; Exit status
    syscall                     ; Call kernel

