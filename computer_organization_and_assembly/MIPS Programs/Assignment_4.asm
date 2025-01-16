#Nick Peters
.data

   list1: 54,26,93,17,77,31,44,55,20
   length1: 9
   list2: 9,8,7,6,5
   length2: 5

   newline: .asciiz "\n"

.text

###############BEGIN main###############
main:
   la $a0, list1
   lw $a1, length1
   jal double_items
   
   la $a0, list2
   lw $a1, length2
   jal double_items
   
   la $a0, list1
   lw $a1, length1
   jal print_list
   
   li $v0, 4 #code for printing a string
   la $a0, newline
   syscall
   
   la $a0, list2
   lw $a1, length2
   jal print_list
   
   j exit_program
###############END main###############   

   
###############BEGIN double_value###############   
double_value:
   add $v0, $a0, $a0
   jr $ra
###############END double_value###############


###############BEGIN double_items###############
#this doesn't do anything yet, it just
#jumps back to the calling procedure
#you must implement this function to work
#like the double_items function in the
#Python program
double_items:
   bge $t0, $a1, double_items_end #$t0 is counter, check if counter == list length
   
   sll $t1, $t0, 2 #memory offset
   add $t2, $a0, $t1 #add base adress of list and memory address
   
   move $t3, $a0 #move the address of the list temporarily
   lw $a0, 0($t2) #put list[i] in $a0
   
   addi $sp, $sp, -12 #reserve space on the stack
   sw $ra, 0($sp) #return addresss
   sw $a1, 4($sp) #list length
   sw $t3, 8($sp) #list address
   
   jal double_value #call double value
   
   lw $ra, 0($sp)
   lw $a1, 4($sp)
   lw $a0, 8($sp)
   addi $sp, $sp, 12
   #load variables again and remove used space from the stack
   
   sw $v0, 0($t2) #put the doubled number back in list[i]
 
   addi $t0, $t0, 1 #add 1 to the loop counter
   b double_items #call double_item again

double_items_end:
   move $t0, $zero # reset counter
   jr $ra
###############END double_items###############


###############BEGIN print_list###############
print_list:
   move $t0, $a0 #$a0 is the list address
   move $t1, $a1 #$a1 is the list length
   li $t2, 0 #loop counter i

print_list_loop:   
   bge $t2, $t1, print_list_end #exit loop if i >= list length
   
   sll $t4, $t2, 2 #multiply loop counter by 4 to get memory offset
   add $t3, $t0, $t4 #add base address of list and memory offset
   
   lw $a0, 0($t3) #load a_list[i]
   li $v0, 1 #code for printing an integer
   syscall
   
   li $v0, 4 #code for printing a string
   la $a0, newline
   syscall
   
   addi $t2, $t2, 1 #increment loop counter
   
   b print_list_loop
   
   
print_list_end:
   jr $ra
###############END print_list###############
   
exit_program:   
