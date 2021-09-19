#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber

.include "cesplib_rars.asm"


utest_draw_cricle:
	li a3, 45
	li a4, 40
	li a5, 10
	li a7, 0x00ff00
	jal draw_circle

	li a3, 128
	li a4, 128
	li a5, 50
	li a7, 0xffff00
	jal draw_circle
	
	li a3, 10
	li a4, 10
	li a5, 5
	li a7, 0xff0000
	jal draw_circle
	

li a7, 10
ecall

.include "draw_circle.asm"
