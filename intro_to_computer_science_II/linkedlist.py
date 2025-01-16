class Node:
    def __init__(self,initdata):
        self.__data = initdata
        self.__next = None
        
    def get_data(self):
        return self.__data
    
    def get_next(self):
        return self.__next
    
    def set_data(self,newdata):
        self.data = newdata
        
    def set_next(self,newnext):
        self.__next = newnext
        
class LinkedList:

    def __init__(self):
        """a LinkedList is initially empty"""
        self.__head = None
        self.__length = 0
        
    def is_empty(self):
        return self.__head == None
    
    def prepend(self,item):
        temp = Node(item)  #step 0: create the new node
        temp.set_next(self.__head) #step 1: set the new node's next to be the old head
        self.__head = temp #step 2: set the new node to be the new head
        self.__length += 1
    
    def __repr__(self):
        list_representation = ""
        current = self.__head #start with the Node at the head
        while current: #this will keep going until current equals None
            list_representation += str(current.get_data())+" -> "
            current = current.get_next() #move on to the next Node in the list
        list_representation += "None" #the last one in the list points to None
        return list_representation            

    def __getitem__(self,index):
        
        if index < 0:
            raise Exception("list index "+str(index)+" is out of range")
        
        current = self.__head
        item_counter = 0
        
        while current and item_counter < index:
            current = current.get_next()
            item_counter += 1
            
        if current == None:
            raise Exception("list index "+str(index)+" is out of range")
            
        return current.get_data()
    
    def pop(self,index): 
        if index < 0:
            raise Exception("list index "+str(index)+" is out of range")
        
        current = self.__head
        previous = None
        item_counter = 0
        
        while current and item_counter < index:
            previous = current
            current = current.get_next()
            item_counter += 1
            
        if current == None:
            raise Exception("list index "+str(index)+" is out of range")
        
        if previous == None:
            self.__head = current.get_next()
        else:
            previous.set_next(current.get_next())
        
        self.__length -= 1
        return current.get_data()
    
    def __contains__(self,target):
        
        current = self.__head
        hit = False
        
        while current and not hit:
            if current.get_data() == target:
                hit = True
            else:
                current = current.get_next()
            
            
        if hit:
            return True
        else:
            return False
        
    def remove(self,val):
        
        current = self.__head
        previous = None
        hit = False
        
        while not hit:
            if current.get_data() == val:
                hit = True
            else:
                previous = current
                current = current.get_next()
            
        if previous == None:
            self.__head = curent.get_next()
        else:
            previous.set_next(current.get_next())
            
    def index(self,target):
        
        current = self.__head
        location = -1
        item_counter = 0
        
        while current and location == -1:
            if current.get_data() == target:
                location = item_counter
            else:
                item_counter += 1
                current = current.get_next()
                
        return location
    
    def size(self):
        return self.__length
        
        


