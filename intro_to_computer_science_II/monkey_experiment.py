import random
"""
Lab 2
Nick Peters

Test Results:

>>>monkey_write("methinks it is like a weasel", 100000)
('lmtlmgkvkttoigmqigrma pizsgo', 8)
>>>monkey_write("methinks it is like a weasel", 100)
('kpthguk iolyfs wavxljmzujvhk', 5)
>>>monkey_write("brevity is the soul of wit", 100000)
('bbffimmvmtkkre sswimorkp t', 7)
>>>monkey_write("to be", 100000)
('tokbi', 3)
>>>monkey_write("to be", 200000)
('to bx', 4)
>>>monkey_write("to be", 500000)
('to be', 5)
"""

def generate_random_text(length, alphabet="abcdefghijklmnopqrstuvwxyz "):
    random_string = ""
    for i in range(length):
        random_string += alphabet[ random.randint(0,len(alphabet)-1 ) ]
    return random_string

def monkey_write(string1, iterations):
    highscore = 0
    bestmatch = ""
    tempstring = ""
    for i in range(iterations):
        count += 1
        count_matches = 0
        tempstring = generate_random_text(length=len(string1))
        for p in range(len(string1)):
            if(string1[p] == tempstring[p]):
                count_matches += 1
        if count_matches > highscore:
            highscore = count_matches
            bestmatch = tempstring
    return (bestmatch, highscore)

print(monkey_write("methinks it is like a weasel", 100000,))
print(monkey_write("methinks it is like a weasel", 100))
print(monkey_write("brevity is the soul of wit", 100000))
print(monkey_write("to be", 100000))
print(monkey_write("to be", 200000))
print(monkey_write("to be", 500000))