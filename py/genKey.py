#
#
# Use: genKey(5)
# => "xmckl"
#
#
import math, random

def genKey(n):
	alphabet = list("abcdefghijklmnopqrstuvwxyz")
	out = ""
	for i in range(n):
		out += alphabet[math.floor(random.randint(0, 25))]
	return out
