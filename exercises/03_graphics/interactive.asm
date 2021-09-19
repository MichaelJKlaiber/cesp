#   ___ ___ ___ ___   _    ___ ___ _____ _   _ ___ ___ 
#  / __| __/ __| _ \ | |  | __/ __|_   _| | | | _ \ __|
# | (__| _|\__ \  _/ | |__| _| (__  | | | |_| |   / _| 
#  \___|___|___/_|   |____|___\___| |_|  \___/|_|_\___|
#
# Copyright 2021 Michael J. Klaiber

j main
.include "cesplib_rars.asm"
#.include "cesplib_fpgrars.asm"


.include "draw_rectangle.asm"



.text
main:

# STEP 1: Set initial rectangle coordinates and the color: We'll use a3-a7 here.
# ADD YOUR STEP 1 CODE HERE



# allocate memory for x0-y1 + color variable and save the values on the stack
addi sp, sp, -20
sw a3,  0 (sp)
sw a4,  4 (sp)
sw a5,  8 (sp)
sw a6, 12 (sp)
sw a7, 16 (sp)

# STEP 2: initialize register s0 with the predefined address of MMIO KEYBOARD (use the symbolic name NOT the address): See cesplib_rars.asm.
# Replace ... by the correct value.
li s0, ...
	
main.loop:
lw a3,  0 (sp)
lw a4,  4 (sp)
lw a5,  8 (sp)
lw a6, 12 (sp)
lw a7, 16 (sp) 

#STEP 3: Complete the missing spots marked below by ... 

lw t0, ... (s0)
beq t0, zero switch.end
lw t0, ... (s0)
switch.start:
  switch.w:
  li t1, ...
  bne t0, ...
  addi a4, a4, -1
  addi a6, a6, -1
  beq zero, zero switch.end
  switch.s:
  li t1, 's'
  bne t0, t1 switch.a
  addi a4, a4, 1
  addi a6, a6, 1
  beq zero, zero switch.end
  switch.a:
  li t1, 'a'
  ...
  beq zero, zero switch.end
  switch.d:
  li t1, 'd'
  bne t0, t1 switch.end
  addi a3, a3, 1
  addi a5, a5, 1
  beq zero, zero switch.end
switch.end:
  #Store changed variables
  sw a3,  0 (sp)
  sw a4,  4 (sp)
  sw a5,  8 (sp)
  sw a6, 12 (sp)

#STEP 4: clear key vector
# ADD YOUR STEP 4 CODE HERE


# STEP 5 draw rectangle
# ADD YOUR STEP 5 CODE HERE

#STEP 6 : call function cesp_sleep to sleep 20 ms
# ADD YOUR STEP 6 CODE HERE


#STEP 7:  Remove rectangle again by drawing a black rectangle of the same dimensions
lw a3,  0 (sp)
lw a4,  4 (sp)
lw a5,  8 (sp)
lw a6, 12 (sp)
li a7, 0
jal draw_rectangle

j main.loop
