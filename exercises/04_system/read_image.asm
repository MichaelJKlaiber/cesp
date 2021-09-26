#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber

	
.data
.include "cesplib_fpgrars.asm"
#.include "cesplib_rars.asm"

.eqv max_read 400000
.eqv BMP_BUFFER 0x10070000
bmp_filename: .string "image8888_small.bmp"


.text


main:
# STEP 1: Initialize a1, a2, a3 to have the right values for function load_image
# 1) We want to store the BMP data first in a buffer at address BMP_BUFFER
# 2) function load_bmp then copies the data to DISPLAY_ADDRESS	

# Add your code here

jal load_bmp

# Infinite loop for FPGRARS
main.loop:
beq zero, zero main.loop


# END
li a7, 10
ecall




load_bmp:
	#input
	#	a1 : pointer to string of filename
	#	a2 : address of buffer where bmp data is stored
	#	a3 : address to display buffer
	
	#output
	#

	
	#intermediate
	#	s0: address of image buffer
	#	s1: image size in bytes
	#	s2: bitmap offset
	#       s3: pointer to string of filename
	#	s4: image width
	#       s5: image height
	#       s6: filehandle
	
	addi sp, sp, -32
	sw s0, 0x0 (sp)
	sw s1, 0x4 (sp)
	sw s2, 0x8 (sp)
	sw s3, 0xc (sp)
	sw s4, 0x10 (sp)
	sw s5, 0x14 (sp)	
	sw s6, 0x18 (sp)	
	sw ra, 0x1c (sp)	

	mv s0, a2
	mv s3, a1
	mv gp, s0


	# STEP 2:
	# Open file handle for reading

	# Add your code here
	ecall             

	
	# STEP 3: Read from descriptor that you opend in the last step
	# Use constant max_read as maximum size for the ecall you choose

	# Add your code here
	ecall

			
	# STEP 4:
	# Get image width

	# Add your code here
	

	# STEP 5:	
	# Get image height

	# Add your code here

		
	
	# copy image
	# t0: src pointer
	# t1: dst pointer
	# t3: width counter
	# t4: height counter
	# t5: display width 
	# t6: distance in bytes between end of row and next row in destination buffer : 4 *(DISPLAY_WIDTH - image_width)

	# STEP 6: Copy the image in the right order from IMAGE_BUFFER to DISPLAY_ADDRESS
	# Prepare t0-t6 according to the

	# Add your code here
	


	loop_y:
		mv t3, s5
		sub t0, t0, t5 # go back by 1 row
		loop_x:
		         #STEP 7: Use read_word_unaligned to read a pixel, then update the pixel format
		         # Add your code here

			bnez t3, loop_x
		sub t0, t0, t5 # go back by 1 row
		add t1, t1, t6
		
		addi t4, t4, -1
		bnez t4, loop_y
		


	lw s0, 0x0 (sp)
	lw s1, 0x4 (sp)
	lw s2, 0x8 (sp)
	lw s3, 0xc (sp)
	lw s4, 0x10 (sp)
	lw s5, 0x14 (sp)	
	lw s6, 0x18 (sp)	
	lw ra, 0x1c (sp)
	addi sp, sp, 32	

	ret
		
	  
.include "readwordunaligned.asm"
