#Nick Peters
#Searched online for a way to go to a new line and found that \n can do that like in some higher level languages.
.data
message: .asciiz "Enter an integer (0 to quit): "
positive_num: .asciiz "Positive number total: "
negative_num: .asciiz "\nNegative number total: "

.text
start:
	li $v0, 4
	la $a0, message
	syscall
	#"Enter an integer (0 to quit): "
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	#read the inputted integer
	
	beqz $t0, end
	#if the inputted integer =0, branch to end
	
	blt $t0, $zero, negative
	#if the inputted integer <0, branch to negative
	
positive:
	add $s0, $t0, $s0
	#add the positive integer to $s0
	b start
	#branch to start

negative:
	add $s1, $t0, $s1
	#add the negative integer to $s1
	b start
	#branch to start

end:
	li $v0, 4
	la $a0, positive_num
	syscall
	#"Positive number total: "
	
	li $v0, 1
	move $a0, $s0
	syscall
	#print $s0
	
	li $v0, 4
	la $a0, negative_num
	syscall
	#"\nNegative number total: "
	
	li $v0, 1
	move $a0, $s1
	syscall
	#print $s1
	
	
