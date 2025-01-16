.text
main:
#a=5
#b=calc(a)
#b = 19
	li $s0, 5
	move $a0, $s0
	jal calc
	move $s1, $v0
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	j exit_program
	
calc:
#d = compute(7)
#return c + d
	addi $sp, $sp, -8    # allocates space
	sw   $a0, 0($sp)     # stores c on the stack
	sw   $ra, 4($sp)     # stores $ra on the stack
	li   $a0, 7          # puts 7 in a0
	jal  compute         # calls compute(7)
 	lw   $ra, 4($sp)     # restores $ra
	lw   $a0, 0($sp)     # restores argument
	addi $sp, $sp, 8     # deallocates space
	add  $v0, $v0, $a0   # adds argument to result
	jr   $ra

compute:
	add $v0, $a0, $a0
	jr $ra
#return e + e

exit_program:
