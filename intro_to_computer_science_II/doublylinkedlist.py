class DoubleNode:
    def __init__(self,initdata):
        self.__data = initdata
        self.__next = None
        self.__prev = None

    def get_data(self):
        return self.__data

    def get_next(self):
        return self.__next
    
    def get_prev(self):
        return self.__prev

    def set_data(self,newdata):
        self.__data = newdata

    def set_next(self,newnext):
        self.__next = newnext
        
    def set_prev(self,newprev):
        self.__prev = newprev

class DoublyLinkedList:

    def __init__(self):
        """a DoublyLinkedList is initially empty"""
        self.__head = None
        self.__tail = None
        self.__length = 0
        
    def is_empty(self):
        return self.__head == None
    
    def size(self):
        return self.__length
    
    def append(self,item):
        #create the new node
        temp = DoubleNode(item)
        
        #case 1: the list is empty
        if self.is_empty():
            
            self.__head = temp
            self.__tail = temp
            
        #case 2: the list has 1 item 
        elif self.__length == 1:
                
            self.__tail = temp
            self.__tail.set_prev(self.__head)
            self.__head.set_next(self.__tail)
            
        #case 3: the list has 2 or more items
        else:

            self.__tail.set_next(temp)
            temp.set_prev(self.__tail)
            self.__tail = temp
            
        #update the length counter because we added an item
        self.__length += 1
    
    def prepend(self,item):
        #create the new node
        temp = DoubleNode(item)
        
        #case 1: the list is empty
        if self.is_empty():
            
            self.__head = temp
            self.__tail = temp
            
        #case 2: the list has 1 item 
        elif self.__length == 1:
                
            self.__tail = temp
            self.__tail.set_prev(self.__head)
            self.__head.set_next(self.__tail)
            
        #case 3: the list has 2 or more items
        else:

            self.__head.set_prev(temp)
            temp.set_next(self.__head) 
            self.__head = temp 
            
        #update the length counter because we added an item
        self.__length += 1
        
    def __repr__(self):
        list_representation = "None <-> "
        current = self.__head #start with the Node at the head
        while current: #this will keep going until current equals None
            list_representation += str(current.get_data())+" <-> "
            current = current.get_next() #move on to the next Node in the list
        list_representation += "None" #the last one in the list points to None
        return list_representation
    
    def __getitem__(self,index):
        
        #case 1: the index is out of range - error
        if index >= self.__length or index < (-1)*self.__length:
            raise Exception("list index "+str(index)+" out of range")
        
        #case 2: positive index - count starting at the head
        elif index >= 0:
            current = self.__head
            item_counter = 0
            
            while current and item_counter < index:
                current = current.get_next()
                item_counter += 1
            
        #case 3: negative index - count starting at the tail
        else:
            current = self.__tail
            item_counter = -1
            
            while current and item_counter > index:
                current = current.get_prev()
                item_counter -= 1
                    
        return current.get_data()
    
    
    def pop(self,index):
        
        #case 1: the index is out of range - error
        if index >= self.__length or index < (-1)*self.__length:
            raise Exception("list index "+str(index)+" out of range")
        
        #case 2: the list is empty - error
        elif self.__head == None:
            raise Exception("You cannot pop from an empty list")
        
        #case 3: there is only one item
        elif self.__head == self.__tail and (index == 0 or index == -1):
            self.__length -= 1
            temp = self.__head
            self.__head = None
            self.__tail = None
            return temp.get_data()
        
        #case 4: 2 or more items, popping the first item
        elif index == 0 or index == self.__length*(-1):
            self.__length -= 1
            temp = self.__head
            self.__head.get_next().set_prev(None)
            self.__head = self.__head.get_next()
            return temp.get_data()
        
        #case 5: 2 or more items, popping the last item
        elif index == -1 or index == self.__length-1:
            self.__length -= 1
            temp = self.__tail
            self.__tail.get_prev().set_next(None)
            self.__tail = self.__tail.get_prev()
            return temp.get_data()
            
        #case 6: 2 or more items, popping a non-end, counting from left
        elif index > 0:
            self.__length -= 1
            
            current = self.__head
            trailing = None
            item_counter = 0
            
            while current and item_counter < index:
                trailing = current
                current = current.get_next()
                item_counter += 1

            trailing.set_next(current.get_next())
            current.get_next().set_prev(trailing)
            
            return current.get_data()
        
        #case 7: 2 or more items, popping a non-end, counting from right
        elif index < 0:
            self.__length -= 1
            
            current = self.__tail
            trailing = None
            item_counter = -1
            
            while current and item_counter > index:
                trailing = current
                current = current.get_prev()
                item_counter -= 1
                
            trailing.set_prev(current.get_prev())
            current.get_prev().set_next(trailing)
   
            return current.get_data()
        
class Queue:
    def __init__(self):
        self.__object_dll = DoublyLinkedList()

    def is_empty(self):
        return self.__object_dll.is_empty()
    
    def enqueue(self,item):
        self.__object_dll.append(item)

    def dequeue(self):
        return self.__object_dll.pop(0)

    def size(self):
        return self.__object_dll.size()
    
class Deque:
    
    def __init__(self):
        self.__items = DoublyLinkedList()
        
    def add_front(self, item):
        self.__items.prepend(item)
        
    def add_rear(self, item):
        self.__items.append(item)
        
    def remove_front(self):
        return self.__items.pop(0)
    
    def remove_rear(self):
        return self.__items.pop(-1)
    
    def is_empty(self):
        return self.__items.is_empty()
    
    def size(self):
        return self.__items.size()
    
def palchecker(a_string):
    chardeque = Deque()

    #put each character from the string into the deque
    for ch in a_string:
        chardeque.add_rear(ch)

    #as long as there are still 2 or more items in the deque,
    #remove the front and rear and compare them
    #if we find any mismatches, it's not a palindrome
    while chardeque.size() > 1:
        first = chardeque.remove_front()
        last = chardeque.remove_rear()
        if first != last:
            return False

    #if we haven't returned False yet, it means the characters all matched
    return True

print( palchecker("lsdkjfskf") ) #should return False
print( palchecker("radar") ) #should return True
        
        
        
