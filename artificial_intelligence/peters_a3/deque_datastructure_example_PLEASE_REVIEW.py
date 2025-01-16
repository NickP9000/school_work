from collections import deque

# ------------- make a new deque with three items -----------------

my_deque = deque(['b', 'c', 'd'])                       
for elem in my_deque:                  # iterate over the deque's elements
    print(elem, end="")
print("")


# ------------- add a new entry to the deque ----------------------

my_deque.append('e')                   # to the right side
my_deque.appendleft('a')               # to the left side
print(my_deque)                        # show the representation of the deque



# ------------- remove an entry from the deque --------------------

elem = my_deque.pop()                       # return and remove the rightmost item
print("popped element ", elem)

elem = my_deque.popleft()                   # return and remove the leftmost item
print("popped lefmost element ", elem)

print("The deque that remains is: ", end="")
print(my_deque)



# ------------- test membership in the deque --------------------
elem = 'c'
if elem in my_deque:                           
    print (elem, " is in the deque")
else:
    print(elem, " is not in the deque")

