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
	nop
	nop
	beq $23, $8, skip22
	nop
	sw $23, 88($0)
skip22:	li $10, -986694283
	sw $10, 92($0)
	subu $22, $10, $0
	nop
	nop
	lh $22, 92($0)
	beq $10, $22, skip23
	nop
	multu $2, $3
skip23:		mflo $2
	addu $2, $2, $4
	li $16, 1549811405
	sw $16, 96($0)
	subu $24, $16, $2
	nop
	lw $24, 96($0)
	nop
	bne $24, $16, skip24
	nop
	multu $2, $3
skip24:		mflo $2
	addu $2, $2, $4
	li $18, 878338649
	sw $18, 100($0)
	subu $26, $18, $0
	lbu $26, 100($0)
	nop
	nop
	bne $26, $18, skip25
	nop
	multu $2, $3
skip25:		mflo $2
	addu $2, $2, $4
	li $15, -629177257
	sw $15, 104($0)
	subu $30, $15, $2
	nop
	nop
	lw $30, 104($0)
	bne $15, $30, skip26
	nop
	multu $2, $3
skip26:		mflo $2
	addu $2, $2, $4
	li $27, -2137295226
	sw $27, 108($0)
	subu $11, $27, $0
	nop
	lbu $11, 108($0)
	nop
	beq $11, $27, skip27
	nop
	multu $2, $3
skip27:		mflo $2
	addu $2, $2, $4
	li $28, 1495291564
	sw $28, 112($0)
	subu $27, $28, $0
	lhu $27, 112($0)
	nop
	nop
	beq $27, $28, skip28
	nop
	multu $2, $3
skip28:		mflo $2
	addu $2, $2, $4
	li $30, 2055753345
	sw $30, 116($0)
	subu $7, $30, $0
	nop
	nop
	lb $7, 116($0)
	bne $30, $7, skip29
	nop
	multu $2, $3
skip29:		mflo $2
	addu $2, $2, $4
	li $29, 629176359
	sw $29, 120($0)
	subu $12, $29, $0
	nop
	lbu $12, 120($0)
	nop
	beq $29, $12, skip30
	nop
	multu $2, $3
skip30:		mflo $2
	addu $2, $2, $4
	li $24, 2715
	sw $24, 124($0)
	subu $19, $24, $0
	lbu $19, 124($0)
	nop
	nop
	beq $24, $19, skip31
	nop
	multu $2, $3
skip31:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $17, $0, $2
	nop
	nop
	srav $17, $2, $0
	bltz, $17, skip32
	nop
	sw $2, 128($0)
skip32:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $11, $0, $2
	nop
	addu $11, $2, $0
	nop
	bltz, $11, skip33
	nop
	sw $2, 132($0)
skip33:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $21, $0, $2
	or $21, $2, $0
	nop
	nop
	bgtz, $21, skip34
	nop
	sw $2, 136($0)
skip34:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $19, $0, $2
	nop
	nop
	subu $19, $2, $0
	bltz, $19, skip35
	nop
	sw $2, 140($0)
skip35:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $24, $0, $2
	nop
	addu $24, $2, $0
	nop
	bgtz, $24, skip36
	nop
	sw $2, 144($0)
skip36:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $29, $0, $2
	addu $29, $2, $0
	nop
	nop
	bltz, $29, skip37
	nop
	sw $2, 148($0)
skip37:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $15, $0, $2
	nop
	nop
	subu $15, $2, $0
	bltz, $15, skip38
	nop
	sw $2, 152($0)
skip38:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $13, $0, $2
	nop
	srlv $13, $2, $0
	nop
	bgez, $13, skip39
	nop
	sw $2, 156($0)
skip39:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $23, $0, $2
	or $23, $2, $0
	nop
	nop
	bgtz, $23, skip40
	nop
	sw $2, 160($0)
skip40:		mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $9, $0, $2
	nop
	nop
	ori $9, $2, 0
	bgez, $9, skip41
	nop
	sw $2, 164($0)
skip41:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $14, $0, $2
	nop
	xori $14, $2, 0
	nop
	bltz, $14, skip42
	nop
	sw $2, 168($0)
skip42:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $17, $0, $2
	xori $17, $2, 0
	nop
	nop
	bltz, $17, skip43
	nop
	sw $2, 172($0)
skip43:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $23, $0, $2
	nop
	nop
	ori $23, $2, 0
	bgez, $23, skip44
	nop
	sw $2, 176($0)
skip44:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $9, $0, $2
	nop
	xori $9, $2, 0
	nop
	bgtz, $9, skip45
	nop
	sw $2, 180($0)
skip45:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $28, $0, $2
	srl $28, $2, 0
	nop
	nop
	bltz, $28, skip46
	nop
	sw $2, 184($0)
skip46:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $15, $0, $2
	nop
	nop
	sll $15, $2, 0
	bltz, $15, skip47
	nop
	sw $2, 188($0)
skip47:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $25, $0, $2
	nop
	ori $25, $2, 0
	nop
	bltz, $25, skip48
	nop
	sw $2, 192($0)
skip48:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	subu $18, $0, $2
	xori $18, $2, 0
	nop
	nop
	bgez, $18, skip49
	nop
	sw $2, 196($0)
skip49:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lui $21, 45265
	nop
	nop
	lui $21, 20270
	bgtz $21, skip50
	nop
	sw $2, 200($0)
skip50:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lui $14, 33124
	nop
	lui $14, 32411
	nop
	bgtz $14, skip51
	nop
	sw $2, 204($0)
skip51:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lui $9, 35385
	lui $9, 30150
	nop
	nop
	bgez $9, skip52
	nop
	sw $2, 208($0)
skip52:	mflo $2
	addu $2, $2, $4
	mthi $2
	nor $20, $2, $0
	nop
	nop
	mfhi $20
	bltz $20, skip53
	nop
	sw $2, 212($0)
skip53:	mtlo $2
	nor $7, $2, $0
	nop
	mflo $7
	nop
	bgez $7, skip54
	nop
	sw $2, 216($0)
skip54:	mtlo $2
	nor $19, $2, $0
	mflo $19
	nop
	nop
	bgtz $19, skip55
	nop
	sw $2, 220($0)
skip55:	mtlo $2
	nor $26, $2, $0
	nop
	nop
	mflo $26
	bgtz $26, skip56
	nop
	sw $2, 224($0)
skip56:	mthi $2
	nor $11, $2, $0
	nop
	mfhi $11
	nop
	bgez $11, skip57
	nop
	sw $2, 228($0)
skip57:	mtlo $2
	nor $17, $2, $0
	mflo $17
	nop
	nop
	bgtz $17, skip58
	nop
	sw $2, 232($0)
skip58:	mtlo $2
	nor $29, $2, $0
	nop
	nop
	mflo $29
	bltz $29, skip59
	nop
	sw $2, 236($0)
skip59:	mtlo $2
	nor $28, $2, $0
	nop
	mflo $28
	nop
	bgtz $28, skip60
	nop
	sw $2, 240($0)
skip60:	mtlo $2
	nor $23, $2, $0
	mflo $23
	nop
	nop
	bgtz $23, skip61
	nop
	sw $2, 244($0)
skip61:	multu $2, $3
	lbu $11, 52($0)
	nor $11, $11, $0
	nop
	nop
	lbu $11, 52($0)
	bgtz $11, skip62
	nop
	sw $2, 248($0)
skip62:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lw $12, 32($0)
	nor $12, $12, $0
	nop
	lw $12, 32($0)
	nop
	bltz $12, skip63
	nop
	sw $2, 252($0)
skip63:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lw $19, 148($0)
	nor $19, $19, $0
	lw $19, 148($0)
	nop
	nop
	bltz $19, skip64
	nop
	sw $2, 256($0)
skip64:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lh $10, 150($0)
	nor $10, $10, $0
	nop
	nop
	lh $10, 150($0)
	bltz $10, skip65
	nop
	sw $2, 260($0)
skip65:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lb $12, 79($0)
	nor $12, $12, $0
	nop
	lb $12, 79($0)
	nop
	bltz $12, skip66
	nop
	sw $2, 264($0)
skip66:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lbu $28, 150($0)
	nor $28, $28, $0
	lbu $28, 150($0)
	nop
	nop
	bltz $28, skip67
	nop
	sw $2, 268($0)
skip67:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lw $8, 220($0)
	nor $8, $8, $0
	nop
	nop
	lw $8, 220($0)
	bgez $8, skip68
	nop
	sw $2, 272($0)
skip68:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lh $15, 218($0)
	nor $15, $15, $0
	nop
	lh $15, 218($0)
	nop
	bgtz $15, skip69
	nop
	sw $2, 276($0)
skip69:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	lb $24, 116($0)
	nor $24, $24, $0
	lb $24, 116($0)
	nop
	nop
	bgtz $24, skip70
	nop
	sw $2, 280($0)
skip70:	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 12
	la $13, skip71
	jalr $29, $13
	addu $13, $29, $1
skip71:	jr $13
	nop
	sw $2, 284($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 16
	la $8, skip72
	jalr $10, $8
	nop
skip72:	addu $8, $10, $1
	jr $8
	nop
	sw $2, 288($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 20
	jal skip73
	nop
skip73:	nop
	addu $13, $31, $1
	jr $13
	nop
	sw $2, 292($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 16
	la $9, skip74
	jalr $15, $9
	addu $9, $15, $1
skip74:	nop
	jr $9
	nop
	sw $2, 296($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 20
	jal skip75
	nop
skip75:	addu $24, $31, $1
	nop
	jr $24
	nop
	sw $2, 300($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 24
	la $13, skip76
	jalr $26, $13
	nop
skip76:	nop
	addu $13, $26, $1
	nop
	jr $13
	nop
	sw $2, 304($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 20
	jal skip77
	addu $14, $31, $1
skip77:	nop
	nop
	jr $14
	nop
	sw $2, 308($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 24
	jal skip78
	nop
skip78:	addu $22, $31, $1
	nop
	nop
	jr $22
	nop
	sw $2, 312($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	li $1, 28
	jal skip79
	nop
skip79:	nop
	addu $15, $31, $1
	nop
	nop
	jr $15
	nop
	sw $2, 316($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal skip80
	addi $23, $31, 12
skip80:	jr $23
	nop
	sw $23, 320($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $19, skip81
	jalr $15, $19
	nop
skip81:	addi $19, $15, 16
	jr $19
	nop
	sw $19, 324($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal skip82
	nop
skip82:	nop
	addi $10, $31, 20
	jr $10
	nop
	sw $10, 328($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $11, skip83
	jalr $23, $11
	addi $11, $23, 16
skip83:	nop
	jr $11
	nop
	sw $11, 332($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $24, skip84
	jalr $21, $24
	nop
skip84:	addi $24, $21, 20
	nop
	jr $24
	nop
	sw $24, 336($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $29, skip85
	jalr $28, $29
	nop
skip85:	nop
	addi $29, $28, 24
	nop
	jr $29
	nop
	sw $29, 340($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal skip86
	addi $12, $31, 20
skip86:	nop
	nop
	jr $12
	nop
	sw $12, 344($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $19, skip87
	jalr $8, $19
	nop
skip87:	addi $19, $8, 24
	nop
	nop
	jr $19
	nop
	sw $19, 348($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $25, skip88
	jalr $17, $25
	nop
skip88:	nop
	addi $25, $17, 28
	nop
	nop
	jr $25
	nop
	sw $25, 352($0)
	mflo $2
	addu $2, $2, $4
dl:	j dl
	nop

	# end code
	# 3400 0000 3400 0000
	ori $0, $0, 0x0000
	ori $0, $0, 0x0000