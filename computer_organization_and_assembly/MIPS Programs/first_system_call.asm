.data

message: .asciiz "Hello!"

.text

li $v0, 4 # 4 is code for print a string
la $a0, message # the argument for the syscall
syscall