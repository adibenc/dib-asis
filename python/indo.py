# -- coding: utf-8 --

m='🔴'
p='⚪'

cnt = 20
line = 6
multiplier = 1
cnt *= multiplier
line *= multiplier

def indo():
	for i in range(0,line):
		print(m*cnt)

	for i in range(0,line):
		print(p*cnt)

indo()
