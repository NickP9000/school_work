class LinkedList:

    def __init__(self):
        """a LinkedList is initially empty"""
        self.__head = None
        
    def is_empty(self):
        return self.__head == None
    
    def prepend(self,item):
        temp = Node(item)  #step 0: create the new node
        temp.set_next(self.__head) #step 1: set the new node's next to be the old head
        self.__head = temp #step 2: set the new node to be the new head