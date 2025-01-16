
class Stack:
    
    def __init__(self): #O(1)
        self.__object_list = []
        
    def push(self,item): #O(1)
        self.__object_list.append(item)
        
    def pop(self): #O(1)
        return self.__object_list.pop()
    
    def is_empty(self): #O(1)
        return len(self.__object_list) == 0
        
    def __repr__(self): #O(n)
        return str(self.__object_list)
    
    def size(self): #O(1)
        return len(self.__object_list)
    
    def peek(self): #O(1)
        return self.__object_list[-1]
    
def reverse_string(the_string):
    reversed_string = ""
    char_stack = Stack()
    
    for char in the_string:
        char_stack.push(char)
        
    while not char_stack.is_empty():
        curr_char = char_stack.pop()
        reversed_string += curr_char
        
    return reversed_string

def check_open_close(the_string):
    paren_stack = Stack()
    
    for char in the_string:
        if char == "(" or char == "{" or char == "[":
            paren_stack.push(char)
        elif char == ")":
            if not paren_stack.peek() == "(":
                return False
            if paren_stack.is_empty():
                return False
            else:
                paren_stack.pop()
        elif char == "}":
            if not paren_stack.peek() == "{":
                return False
            if paren_stack.is_empty():
                return False
            else:
                curr_stack_char = paren_stack.pop()
        elif char == "]":
            if not paren_stack.peek() == "[":
                return False
            if paren_stack.is_empty():
                return False
            else:
                curr_stack_char = paren_stack.pop()
            
    if not paren_stack.is_empty():
        return False
    else:
        return True
    