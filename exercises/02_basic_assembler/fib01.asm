#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2020 Michael J. Klaiber

########################################
#CESP Exercise: Interative Fibonacci
########################################
	
.data
#STEP 1: Register an integer array length 20 (or logner ... it is your choice) as global variabel and initialize it to zero.
#        Hint: Use an assembler directive and a label (use the name fibonacci for the label).
.align 2
# ADD YOUR STEP 1 CODE HERE

newline:
.string "\n"


.text


main:
	#STEP 2: Implement the call of the fib function
	#        Hints: 
	#              1) Pass the address of the global variable called "fibonacci" and the constant "n" that defines the length via the correct registers to function fib 
	
	# ADD YOUR STEP 2 CODE HERE

	
	#STEP 6: Print the results

	# ADD YOUR STEP 6 CODE HERE. Use the print function
	
	print:
		#Input:
		# a1: address to integer that is printed

		# print integer
		lw a0, (a1)
		li  a7, 1          
	    	ecall
	    	# print \n string
	    	la a0, newline
	    	li  a7, 4          
	    	ecall
	
	#STEP 7: OS Call to exit program

	# ADD YOUR STEP 7 CODE HERE

# The function fib expects the following arguments
# a1: address to array
#      -- in C Code: int* result 	
# a2: integer number that indicates number of Fibonacci number to be calculated
#      -- inC Code: int n
fib:
	#STEP 3: First initialize fibonacci[0] and fibonacci[1] with 1 dependent on argument n

	# ADD YOUR STEP 3 CODE HERE
	
_fib_for_loop:
	#STEP 4: implement a for loop calculate fibonacci[2] ... fibonacci[n-1] if applicable

	# ADD YOUR STEP 4 CODE HERE
	
_fib_end:
	#STEP 5: Jump back into main using the address you have saved before


print:
	#Input:
	# a1: address to integer that is printed

	# print integer
	lw a0, (a1)
	li  a7, 1          
	ecall
	# print \n string
	la a0, newline
	li  a7, 4          
	ecall
	ret
