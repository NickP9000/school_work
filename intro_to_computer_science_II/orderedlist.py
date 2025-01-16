class Node:
    def __init__(self,initdata):
        self.__data = initdata
        self.__next = None

    def get_data(self):
        return self.__data

    def get_next(self):
        return self.__next

    def set_data(self,newdata):
        self.__data = newdata

    def set_next(self,newnext):
        self.__next = newnext
        
class OrderedList:

    def __init__(self):
        self.__head = None
        self.__length = 0
        
    def size(self):
        return self.__length
        
    def is_empty(self):
        return self.__head == None
    
    def __repr__(self):
        list_representation = ""
        current = self.__head #start with the Node at the head
        while current: #this will keep going until current equals None
            list_representation += str(current.get_data())
            if current.get_next(): #if there's another item after this one, print the comma
                list_representation += ", " 
            current = current.get_next() #move on to the next Node in the list
        return list_representation
    
    def add(self,item):
        newnode = Node(item)
        self.__length += 1
        
        #case 1: the list is empty
        if self.is_empty():
            self.__head = newnode
            
        #case 2: new item goes at the head
        elif newnode.get_data() <= self.__head.get_data():
            newnode.set_next(self.__head)
            self.__head = newnode
            
        #case 3: new item is not the head
        else:
            self.__add_after(newnode,self.__head)
            
    def __add_after(self, newnode, currnode):
        #check if the newnode goes immediate after currnode
        if currnode.get_next() == None or newnode.get_data() <= currnode.get_next().get_data():
            #re-assign references to put it here
            newnode.set_next( currnode.get_next() )
            currnode.set_next(newnode)
        else:
            #recursively insert the newnode later in the list
            self.__add_after(newnode,currnode.get_next())
            
            
    def search(self,item):
        return self.__search_node(item,self.__head)
    
    def __search_node(self,item,currnode):
        #if we're at the end of the list or this item is smaller than the
        #current item, we know it can't be in the list
        if currnode == None or item < currnode.get_data():
            return False
        #we found the item - return True
        elif currnode.get_data() == item:
            return True
        #search the rest of the list
        else:
            return self.__search_node(item,currnode.get_next())
    
    def index(self,item):
        return self.__index_node(item,self.__head)
    
    def __index_node(self,item,currnode):
        if currnode == None or item < currnode.get_data():
            raise Exception(item,"is not in the list")
        elif currnode.get_data() == item:
            return 0
        else:
            return 1+self.__index_node(item,currnode.get_next())

        
mylist = OrderedList()
mylist.add(5)
mylist.add(1)
mylist.add(9)
mylist.add(13)
mylist.add(5)
mylist.add(2)
mylist.add(15)
mylist.add(4)
print(mylist)
print(mylist.index(9))