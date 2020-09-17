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
	addi $s5,$zero,7
	addi $sp,$sp,-12
	sw $s5,4($sp)#load-use hazard
	lw $s5,4($sp)
	sw $s5,8($sp)

	addi $s1,$zero,5
	sw $s1,0($sp)#sw-lw hazard
	lw $s1,0($sp)
	or $s4,$zero,$s1


	beq $zero,$zero,label #beq
	addi $s2,$zero,5
label:
	addi $s2,$zero,6
	addi $s3,$zero,7
	add $s4,$s3,$s2 #Data hazard
	add $s7,$s2,$zero #Structure hazard
	
	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000