.data

salary: 100000
bonus: 5000
health_premuim: 2500
taxes: 10000
pay: 0

.text

lw $t0, salary
lw $t1, bonus
lw $t2, health_premuim
lw $t3, taxes

add $t4, $t0, $t1 #t4 = salary + bonus
add $t5, $t2, $t3 #t5 = health_premium + taxes
sub $t6, $t4, $t5 #t6 = t4 - t5 [ (salary + bonus) - (health_premium + taxes) ]
sw $t6, pay