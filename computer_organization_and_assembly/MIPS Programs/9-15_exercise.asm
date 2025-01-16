.data

i: 5
j: 6
k: 0
message: .asciiz "The value of k is "

.text

    lw $s0, i
    lw $s1, j
    
    bne $s0, $s1, not_equal
equal:
    li $s2, 1
    sw $s2, k
    b done
    
not_equal:
    li $s2, 2
    sw $s2, k

done:
    li $v0, 4 #4 is the code for printing a string
    la $a0, message #the argument for the syscall
    syscall 

    li $v0, 1 #1 is the code for printing an int
    lw $a0, k #the argument for the syscall
    syscall
    