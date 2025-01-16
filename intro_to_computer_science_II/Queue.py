"""
The front of the queue will be index 0
The back of the queue will be the largest occupied index
"""
class Queue:
    def __init__(self): 
        self.__object_list = []

    def is_empty(self): #O(1)
        return self.__object_list == []

    def dequeue(self): #O(n)
        return self.__object_list.pop(0)

    def size(self): #O(1)
        return len(self.__object_list)
    
    def enqueue(self, item): #O(1)
        self.__object_list.append(item)
        
    def __repr__(self):
        return str(self.__object_list)
        