import random

def generate_random_text(length, alphabet):
    random_string = " "
    for i in range(length):
        random_string += alphabet[ random.randint(0,len(alphabet)-1 ) ]
    return random_string

def score (string1, string2):
    count = 0
    for i in range(len(string1)):
        if string1[i] == string2[i]:
            count += 1
    return count

print( score("test string 1", "test string 2"))
test_shakespeare = "methinks it is like a weasel"
print( score(test_shakespeare, generate_random_text(length=len(test_shakespeare), alphabet="abcdefghijklmnopqrstuvwxyz ")))
    