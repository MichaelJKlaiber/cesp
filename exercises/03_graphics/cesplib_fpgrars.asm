.eqv DISPLAY_ADDRESS 0xFF000000
.eqv DISPLAY_WIDTH 320
.eqv DISPLAY_HEIGHT 240
.eqv KEYBOARD_ADDDRESS 0xFF200000


cesp_sleep:
# Input:
#   a0: number of ms to sleep
  li a7, 32
  ecall
  ret
  
