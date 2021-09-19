#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber

########################################
#CESP Exercise: Draw Rectangle
########################################


# Function to draw rectangle from position x1,y1 to x2,y2 with fill color c
# a3: unsigned integer x1 -- left boundary of rectangle
# a4: unsigned integer y1 -- top boundary of rectangle
# a5: unsigned integer x2 -- right boundary of rectangle
# a6: unsigned integer y2 -- bottom boundary of rectangle
# a7: unsigned integer c  -- fill color of rectangle as RGB value

draw_rectangle:
	#STEP 3: Save and restore all necessary register to/from the stack
	# ADD YOUR STEP 3 CODE HERE
	
	_loopy:
		_loopx:	
			#STEP 1: Move the right value to registers a1-a3 and call draw_pixel
			# ADD YOUR STEP 1 CODE HERE
			
			addi .., ..., 1
			bne ..., .., _loopx
		addi ..., .., 1
		#STEP 2: Don't forget to set x=x0 again
		# ADD YOUR STEP 2 CODE HERE			
		bne ..., ..., _loopy


	ret


.include "draw_pixel.asm"

