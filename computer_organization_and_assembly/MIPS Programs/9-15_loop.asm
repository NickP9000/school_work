.text
    li $s0, 0
    li $t0, 10
    li $s1, 0

start_loop:
    sle $t1, $t0, $s0
    bne $t1, $zero, done
    
    add $s1, $s0, $s1

    addi $s0, $s0, 1
    b start_loop

done:
    li $v0, 1
    add $a0, $s1, $zero
    syscall