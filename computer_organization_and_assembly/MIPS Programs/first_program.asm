#This is my first MIPS program

.data

a: 9
b: 3
result: 0

.text

lw $t0, a
lw $t1, b
add $t2, $t0, $t1
sw $t2, result