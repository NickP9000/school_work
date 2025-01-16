.data

prompt: .asciiz "Enter an integer:"

.text

li $v0, 4 #4 is code for printing string
la $a0, prompt # argument for syscall
syscall

li, $v0, 5 #5 is code for reading an integer
syscall

add $t0, $v0, $zero