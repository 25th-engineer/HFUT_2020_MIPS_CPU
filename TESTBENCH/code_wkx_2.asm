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


