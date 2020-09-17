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
		lw $1, 8188($0)
	li $2, 1370698181
	addu $2, $1, $2
	li $3, 624781182
	li $4, -1346036914
	multu $2, $3
	li $22, -928840339
	addu $24, $22, $2
	nop
	nop
	sllv $24, $22, $0
	beq $24, $22, skip0
	nop
	addiu $2, $2, 27222
skip0:	sw $2, 0($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $25, 1594176031
	addu $10, $25, $2
	nop
	addu $10, $25, $0
	nop
	bne $10, $25, skip1
	nop
	addiu $2, $2, 31929
skip1:	sw $2, 4($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $25, -2119359507
	addu $11, $25, $2
	xor $11, $25, $0
	nop
	nop
	beq $11, $25, skip2
	nop
	addiu $2, $2, 3010
skip2:	sw $2, 8($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $19, 1297194016
	addu $14, $19, $2
	nop
	nop
	xor $14, $19, $0
	beq $14, $19, skip3
	nop
	addiu $2, $2, 29169
skip3:	sw $2, 12($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $23, 1553809414
	addu $24, $23, $0
	nop
	or $24, $23, $2
	nop
	beq $24, $23, skip4
	nop
	addiu $2, $2, 6765
skip4:	sw $2, 16($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $11, 1462873855
	addu $25, $11, $2
	subu $25, $11, $0
	nop
	nop
	beq $25, $11, skip5
	nop
	addiu $2, $2, 24212
skip5:	sw $2, 20($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $21, -1935796249
	addu $29, $21, $0
	nop
	nop
	or $29, $21, $2
	beq $29, $21, skip6
	nop
	addiu $2, $2, 20534
skip6:	sw $2, 24($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $8, 600920159
	addu $10, $8, $0
	nop
	sllv $10, $8, $2
	nop
	beq $10, $8, skip7
	nop
	addiu $2, $2, 18367
skip7:	sw $2, 28($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $10, 245016401
	addu $16, $10, $0
	or $16, $10, $2
	nop
	nop
	bne $16, $10, skip8
	nop
	addiu $2, $2, 1554
skip8:	sw $2, 32($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $25, 1977109191
	addiu $20, $25, 0
	nop
	nop
	addiu $20, $25, 9834
	beq $25, $20, skip9
	nop
	nor $2, $2, $25
skip9:	sw $2, 36($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $24, -1206068049
	addiu $13, $24, 0
	nop
	addiu $13, $24, 28753
	nop
	beq $24, $13, skip10
	nop
	nor $2, $2, $24
skip10:	sw $2, 40($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $21, 2080420061
	addiu $7, $21, 0
	srl $7, $21, 1
	nop
	nop
	beq $21, $7, skip11
	nop
	nor $2, $2, $21
skip11:	sw $2, 44($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $24, -791642528
	addiu $22, $24, 0
	nop
	nop
	xori $22, $24, 6438
	bne $24, $22, skip12
	nop
	nor $2, $2, $24
skip12:	sw $2, 48($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $8, -911568785
	addiu $22, $8, 0
	nop
	addiu $22, $8, 17950
	nop
	beq $8, $22, skip13
	nop
	nor $2, $2, $8
skip13:	sw $2, 52($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $21, 426530782
	addiu $8, $21, 6622
	ori $8, $21, 23640
	nop
	nop
	bne $21, $8, skip14
	nop
	nor $2, $2, $21
skip14:	sw $2, 56($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $18, 704083205
	addiu $19, $18, 28241
	nop
	nop
	sll $19, $18, 14
	beq $18, $19, skip15
	nop
	nor $2, $2, $18
skip15:	sw $2, 60($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $15, 1322704609
	addiu $11, $15, 0
	nop
	addiu $11, $15, 25990
	nop
	beq $15, $11, skip16
	nop
	nor $2, $2, $15
skip16:	sw $2, 64($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $29, -1891138629
	addiu $25, $29, 1450
	sll $25, $29, 26
	nop
	nop
	bne $29, $25, skip17
	nop
	nor $2, $2, $29
skip17:	sw $2, 68($0)
	mflo $2
	addu $2, $2, $4
	addu $28, $2, $8
	lui $8, 64451
	lui $28, 64451
	nop
beg18:	beq $8, $28, skip18
	addu $8, $0, $0
	beq $0, $0, beg18
	subu $28, $28, $28
skip18:	sw $28, 72($0)
	lui $8, 64451
	nop
	lui $28, 19666
beg19:	bne $8, $28, skip19
	addu $28, $0, $0
	beq $1, $1, beg19
	addu $8, $28, $2
skip19:	sw $8, 76($0)
	li $30, -1602503051
	mthi $30
	li $30, -1602503051
	li $23, 523843457
	nop
	nop
	mfhi $23
	beq $30, $23, skip20
	nop
	sw $30, 80($0)
skip20:	li $13, -1153218862
	mtlo $13
	li $13, -1153218862
	li $7, 638425955
	nop
	mflo $7
	nop
	bne $13, $7, skip21
	nop
	sw $13, 84($0)
skip21:	li $23, -1501334171
	mthi $23
	li $23, -1501334171
	li $8, -376855767
	mfhi $8


	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000