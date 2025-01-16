.text 

li $s0, 16
li $s1, 20

#shift left logical
sll $t0, $s0, 1
sll $t1, $s0, 2
sll $t4, $s1, 0
sll $t5, $s1, 2

#shift right logical
srl $t2, $s0, 1
srl $t3, $s0, 2
srl $t6, $s1, 1
srl $t7, $s1, 2