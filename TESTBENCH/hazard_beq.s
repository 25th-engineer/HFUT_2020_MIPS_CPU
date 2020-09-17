	.org 0x0
	.set noat
	.set noreorder			#不进行指令调度
	.set nomacro
	.global __start
__start:
	# 注意，MIPS编译时，会将rs和rt的二进制位置互换，写法上是rt,rs，指令码是opcode rs rt(写入rt)
	# 用ori指令作为开始标志
	# start code
	# ori $0, $0, 0x0000
	# 3400 0000
	# 此处开始书写代码
	.org 0x0000
	ori $0, $0, 0x0000
	
	# 真正的代码
	addi $17 $0 2
	addi $18 $0 1
	addi $19 $0 0
	addi $20 $0 0
	addi $21 $0 0
	addi $22 $0 300
	beq $17 $17 LI
	addi $17 $0 0xff
	addi $18 $0 0xff
LI:	sub  $19 $17 $18
	and  $20 $17 $19
	sw   $17 0($22)
	lw   $21 0($22)


	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000