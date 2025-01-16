def check_parens(astring):
    
    paren_stack = Stack()
    
    #checking each character in the string
    for char in astring:
        
        if char == "(":
            paren_stack.push(char)
            
        elif char == ")":
            if paren_stack.is_empty():
                return False #there's no ( to match this )
            else:
                paren_stack.pop()
        
    if paren_stack.is_empty():
        return True #all parens matched
    else:
        return False #there is an extra ( that was unmatched
    
print(check_parens("((()))"))