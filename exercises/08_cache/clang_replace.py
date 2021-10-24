import re
import sys

with open(sys.argv[1]) as f:
    s = f.read()


a = re.sub("\(.*\):",":", s)
a = re.sub("\(.*\*.*\).*\n","\n", a)
a = re.sub(".L", "L", a)
a = re.sub("call", "jal ", a)

header = """
.data
     // move .data part here
.text
jal main
li a7,10
ecall

"""
a = header + a
#print(a)

#         la a0, input0
#        la a1, input1
#        la a2, result
with open("ripes" + sys.argv[1], "w") as f:
	f.write(a)
