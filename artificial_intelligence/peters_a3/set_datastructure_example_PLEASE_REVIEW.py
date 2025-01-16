

# ------------- make a new set with three items -----------------
print("Printing the current elements in the set: ", end="")
my_set = set(['b', 'c', 'd'])         # make a new set with three items             
for elem in my_set:                   # iterate over the set elements
    print(elem, end="")               # note that a set doesn't maintain an order
print("")                             



# ------------- add a new entry to the set ----------------------
print("After adding 'e' and 'a' current elements in the set: ", end="")
my_set.add('e')                      # add a new entry
my_set.add('a')                      # add a new entry
print(my_set)                        # show the representation of the set
                                     # again note that a set doesn't maintain an order


# ------------- remove an entry from the set --------------------
elem = my_set.pop()                  # return and remove an arbitrary element
print("Popped element (randomly) from the set: ", elem)

print("The set that remains is: ", end="")
print(my_set)



# ------------- test membership in the set --------------------
print("Testing membership in the set: ", end="")
elem = 'c'
if elem in my_set:                           
    print (elem, " is in the set")
else:
    print(elem, " is not in the set")


