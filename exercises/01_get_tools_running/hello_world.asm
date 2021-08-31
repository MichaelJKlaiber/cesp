.globl _main    


.data
welcome:      .ascii "Welcome to Computer Engineering and Systems Programming !\n" 

.text
_main:  li  a0, 1  
        la  a1, welcome
        li  a2, 60  
        li  a7, 64 
        ecall              

        addi    a0, zero, 0  
        addi    a7, zero, 93  
        ecall    


