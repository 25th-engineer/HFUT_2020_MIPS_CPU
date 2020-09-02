addi $s2,$zero,4
addi $s1,$zero,4
addi $sp,$sp,-4
sw $s1,0($sp)
lw $s1,0($sp)
addi $s4,$zero,7
beq $s1,$s2,label
addi $s3,$zero,5
label:
addi $s3,$zero,6