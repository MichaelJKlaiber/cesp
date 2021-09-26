#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber


	


# testcode
li t0, 0xdeadbeef
li t1, 0xaffed00f
sw t0, (gp)
sw t1, 4 (gp)
mv a1, gp
addi a1,a1,2
jal read_word_unaligned

li a7, 10
ecall

.include "readwordunaligned.asm"