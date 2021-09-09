#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber

########################################
#CESP Exercise: Simple Addition
########################################
                                 
main:   li t0, 0x42
	li t1, 0x66
	add t2, t0, t1      

	# Terminate program with code 0
        addi    a0, zero, 0  
        addi    a7, zero, 93  
        ecall    


