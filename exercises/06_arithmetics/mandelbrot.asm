#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber
                

#############################################
# CESP Exercise: Mandelbrot Fixed Point   #
#############################################

.include "cesplib_rars.asm"
#.include "cesplib_fpgrars.asm"

# STEP 1: Familize with constants
# Constants
.eqv Q_INTEGER 24
.eqv Q_FRACTION 8
.eqv MAX_ITERATIONS 50  # int max_iterations = 50;
.eqv LIMIT2 0x400 # limit*limit = 2*2
	
 Step 2: initialize constant using the fixed point notation defined above
         Hint: either provide values as negative hexadecimal OR as two's complement value, e.g. -1.0 is either -0x100 or 0xff,,ffeff+1=0xff..fff00
.eqv X_START 0x0 #TODO change constants to correct values
.eqv Y_START 0x0
.eqv X_STRETCH 0x0
.eqv Y_STRETCH 0x0	
    
main:
    # STEP 3: Here  a1 to a4 are initialized with X_START to Y_STRETCH 
    li a1, X_START
    li a2, Y_START
    li a3, X_STRETCH
    li a4, Y_STRETCH
    
    # Jump to function "mandelbrot"
    jal mandelbrot


    j main
    # Exit
    li a7, 10
    ecall

    
mandelbrot:
# Input:
#   a1: x_start
#   a2: y_start
#   a3: x_stretch
#   a4: y_stretch
# Output: None


    # STEP 5: push the callee save registers to the stack

    # STEP 6: implement the code inside y for loop here
    # Use the following register-to-variable mapping (this is just a suggestion)
    # s0: Zr
    # s1: Zi 
    # s2: Tr
    # s3: Ti
    # s4: x
    # s5: y
    # s6: i
    # s7: Cr
    # s8: Ci
    

    #for(y=0;y<h;++y)
    #{

        # ADD YOUR CODE FOR STEP 6 HERE. This include calling "plot"

    #}


    #STEP 8: pop callee save register from stack

    ret


plot:
# Creates colored pixel at position (x,y)  

# Inputs
#    a1: iterations
#    a2: x
#    a3: y
# Outputs: None

# STEP 7: 

    #TODO ADD code for STEP 7 here

    ret
