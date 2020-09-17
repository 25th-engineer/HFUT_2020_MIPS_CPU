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
	addi  $2 $0 1
	addiu $3 $0 2
	andi  $4 $2 2
	ori   $5 $2 2
	xori  $6 $2 2
	lui   $7 5

	slt   $8 $2 $3
	slti  $9 $2 -1
	sltiu $10 $2 2
	sltu  $10 $2 $3

	mult $2 $3
	mfhi $11
	mflo $12

	multu $2 $3
	mfhi $13
	mflo $14

	div $2 $3
	mfhi $15
	mflo $16

	divu $2 $3
	mfhi $16
	mflo $17

	addi $18 $0 200
	sb $5 0($18)
	sh $5 4($18)
	sw $5 8($18)

	lb $19 0($18)
	lbu $20 0($18)
	lh $21 4($18)
	lhu $22 4($18)
	lw $23 8($18)

	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000