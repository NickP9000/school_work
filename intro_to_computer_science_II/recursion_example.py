def factorial(n):
    if n == 1:
        return 1
    else:
        result = n * factorial(n-1)
        return result

def listsum(num_list):
   if len(num_list) == 1:
        return num_list[0]
   else:
        return num_list[0] + listsum(num_list[1:])
    
def reverse_string(string):
    if string == "":
        return ""
    else:
        return reverse_string(string[1:]) + string[0]

print(reverse_string("test string"))
#print(factorial(10))