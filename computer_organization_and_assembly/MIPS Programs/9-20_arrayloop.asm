.data

my_array: 10, 6, 0, 27, 92, 18, 42
newline: .asciiz "\n"


.text

    la $s0, my_array #load the base address of the array
    li $t0, 0 #loop counter
    li $s1, 0 #sum of items

loop:

    slti $t1, $t0, 7 #check if loop counter < 7
    beq $t1, $zero, end #if not < 7, branch to end

    #calculate address of next thing in the array
    sll $t2, $t0, 2 #multiply the loop counter by 4
    add $t2, $t2, $s0 #add counter*4 to my_array address

    #print the item from the array
    lw $a0, 0($t2) #load next value from array
    li $v0, 1 #print integer
    syscall
    
    add $s1, $a0, $s1 #add my_array[i] onto the sum

    #print a newline
    la $a0, newline 
    li $v0, 4 #print string
    syscall

    addi $t0, $t0, 1 #increment the loop counter

    b loop

end:

   add $a0, $s1, $zero
   li $v0, 1
   syscall