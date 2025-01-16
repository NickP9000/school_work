class TreeNode:
    
    def __init__(self,initdata):
        self.__data = initdata
        self.__left = None
        self.__right = None
        
    def add(self,item):
        if (item < self.__data):
            if self.__left == None:
                new_node = TreeNode(item)
                self.__left = new_node
            else:
                self.__left.add(item)
        if (item > self.__data):
            if self.__right == None:
                new_node = TreeNode(item)
                self.__right = new_node
            else:
                self.__right.add(item)
                
    def __repr__(self):
        return self.string_rep("")
    
    def string_rep(self,prefix):
        rval = prefix+"|-"+str(self.__data)
        if self.__left:
            rval += "\n"+self.__left.string_rep(prefix+"  ")
        if self.__right:
            rval += "\n"+self.__right.string_rep(prefix+"  ")
        return rval
                
    def search(self,item):
        if (self.__data == item):
            return True
        elif (item < self.__data and self.__left != None):
            return self.__left.search(item)
        elif (item > self.__data and self.__right!= None):
            return self.__right.search(item)
        return False
    
    def replace_with_successor(self):
        #find successor node
        curr_pos = "right"
        prev = self
        curr = self.__right
        while curr.__left != None:
            curr_pos = "left"
            prev = curr
            curr = curr.__left
                
        #replace self's value with successor's value
        self.__data = curr.__data
        #remove the successor node
        curr.remove_this_node(prev,curr_pos)
        
    def remove(self,item,parent,position):
        if item == self.__data:
            self.remove_this_node(parent,position)
        elif item < self.__data and self.__left:
            self.__left.remove(item,self,"left")
        elif item > self.__data and self.__right:
            self.__right.remove(item,self,"right")
        else:
            raise Exception("Cannot remove "+str(item)+". It is not in the tree.")
        
    def remove_this_node(self,parent,position):
        
        #this node is a right child
        if position == "right":
            
            #no children
            if self.__left == None and self.__right == None:
                parent.__right_child = None
            #only a right child
            elif self.__left == None:
                parent.__right_child = self.__right
            #only a left child
            elif self.__right == None:
                parent.__right = self.__left
            else:
                self.replace_with_successor()
                
        elif position == "left":
            
                        
            #no children
            if self.__left == None and self.__right == None:
                parent.__left = None
            #only a right child
            elif self.__left == None:
                parent.__left = self.__right
            #only a left child
            elif self.__right == None:
                parent.__left = self.__left
            else:
                self.replace_with_successor()
                
        elif position == "root":
            
            #no children
            if self.__left == None and self.__right == None:
                parent.set_root(None)
            #only a right child
            elif self.__left == None:
                parent.set_root(self.__right)
            #only a left child
            elif self.__right == None:
                parent.set_root(self.__left)
            else:
                self.replace_with_successor()
        
            
t = TreeNode(50)
t.add(51)
t.add(55)
t.add(30)
t.add(33)
