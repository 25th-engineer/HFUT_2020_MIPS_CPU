	.org 0x0
	.set noat
	.set noreorder			#不进行指令调庿
	.set nomacro
	.global __start
_start:
   ori $1,$0,0x1100        # $1 = $0 | 0x1100 = 0x1100
   ori $1,$1,0x0020        # $1 = $1 | 0x0020 = 0x1120
   ori $1,$1,0x4400        # $1 = $1 | 0x4400 = 0x5520
   ori $1,$1,0x0044        # $1 = $1 | 0x0044 = 0x5564
   
   # end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000