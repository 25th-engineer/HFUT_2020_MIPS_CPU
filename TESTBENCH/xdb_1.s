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
	addi $t1,$zero,2
	addi $t2,$zero,2
	beq $t1,$t2,label
	addi $s1,$zero,2
	addi $s2,$zero,2
	
label:
	sub $t3,$t1,$t2
	addi $t1,$zero,0x10010020
	ori $t4,$t3,10
	andi $t5,$t3,9
	j l
	addi $s3,$zero,2
	addi $s4,$zero,2
	
l:
	sw $t2,0($t1)
	sb $t2,4($t1)
	sh $t2,8($t1)
	lb $t3,0($t1)
	sw $t3,12($t1)


	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000