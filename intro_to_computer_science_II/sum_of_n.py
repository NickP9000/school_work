import time
"""
timing tests
10000000
Loop: 0.6992611885070801
Formula: 0.0

20000000
Loop: 1.3825957775115967
Formula: 0.0

30000000
Loop: 2.0921475887298584
Formula: 0.0

40000000
Loop: 2.7959461212158203
Formula: 0.0

50000000
Loop:3.3901987075805664
Formula: 0.0
"""
#idea 1
#"""
def sum_of_n_loop(n):
    total = 0
    
    for i in range(n+1):
        total += i
    
    return total
    #1+2+3+...+n

#"""
#"""
#idea 2
def sum_of_n_formula(n):
    return n*(n+1)/2

#"""
nval = 500000000

start = time.time()
print(sum_of_n_loop(nval))
end = time.time()
print("Loop:",end-start)
start = time.time()
print(sum_of_n_formula(nval))
end = time.time()
print("Formula:",end-start)
