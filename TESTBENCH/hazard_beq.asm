main:   addi $17 $0 2
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
