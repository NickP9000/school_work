#Name: Nick Peters
#Descruption: The program takes two integer inputs from the user, multiplies them, and then returns the product. As a little passion
# 		project, I made it so the ending message which displays the product also displays the two factors.

.data

message1: .asciiz "Input an integer to begin multiplication: "
message2: .asciiz "Input a second integer to continue: "
message3: .asciiz "The product of "
fragment1: .asciiz " and "
fragment2: .asciiz " is: "

.text

 # Direct user to input number
 li $v0, 4 #6
 la $a0, message1
 syscall #1
 #read number and put it in $t0
 li $v0, 5
 syscall #2
 add $t0, $v0, $zero #5
 
 # Direct user to input another number
 li $v0, 4
 la $a0, message2
 syscall
 #read number and put it in $t1
 li $v0, 5
 syscall
 add $t1, $v0, $zero
 
 #multiple and move the answer to $t2
 mult $t0, $t1 #3
 mflo $t2
 
 # Start building the ending message
 li $v0, 4
 la $a0, message3
 syscall 
 #"The product of "
 
 li $v0, 1
 move $a0, $t0
 syscall
 #"The product of " $t0
 
 li $v0, 4
 la $a0, fragment1
 syscall
 #"The product of " $t0 " and "
 
 li $v0, 1
 move $a0, $t1
 syscall
 #"The product of " $t0 " and " $t1
 
 li $v0, 4
 la $a0, fragment2
 syscall
 #"The product of " $t0 " and " $t1 " is: "
 
 li $v0, 1
 move $a0, $t2
 syscall #4
 #"The product of " $t0 " and " $t1 " is: " $t2
