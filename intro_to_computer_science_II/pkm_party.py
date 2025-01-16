import requests
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
            if (current.get_next() == None):
                list_representation += str(current.get_data())
                break
            list_representation += str(current.get_data())+", "
            current = current.get_next() #move on to the next Node in the list
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
                break
            else:
                current = current.get_next()
                
        return hit
        
    def remove(self,val):
        
        current = self.__head
        previous = None
        hit = False
        self.__length -=1
        
        while not hit:
            if current.get_data() == val:
                hit = True
            else:
                previous = current
                current = current.get_next()
            
        if previous == None:
            self.__head = current.get_next()
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
    
    #input two different indices to switch the values
    def switch(self,val1,val2):
        current1 = self.__head
        current2 = self.__head
        previous1 = None
        previous2 = None
        item_counter = 0
        temp = None
        temp2 = None
        
        while current1 and item_counter < val1:
            previous1 = current1
            current1 = current1.get_next()
            item_counter += 1
        
        item_counter = 0
        while current2 and item_counter < val2:
            previous2 = current2
            current2 = current2.get_next()
            item_counter +=1
            
        if previous1 == None or previous2 == None:
            if previous1 == None:
                self.__head = current2
                previous2.set_next(current1)
                temp = current1.get_next()
                temp2 = current2.get_next()
                current2.set_next(temp)
                current1.set_next(temp2)
            if previous2 == None:
                self.__head = current1
                previous1.set_next(current2)
                temp2 = current2.get_next()
                temp = current1.get_next()
                current1.set_next(temp2)
                current2.set_next(temp)
        else:
            previous1.set_next(current2)
            previous2.set_next(current1)
            temp = current1.get_next()
            temp2 = current2.get_next()
            current1.set_next(temp2)
            current2.set_next(temp)
        
    
class PokemonParty:
       
    def __init__(self):
        self.__party = LinkedList()
        
    def __repr__(self):
        return str(self.__party)
        
    def is_empty(self):
        return self.__party.is_empty()
    
    def prepend(self,pkm):
        pkm.lower()
        base_url = "https://pokeapi.co/api/v2/pokemon/"
        data = requests.get(base_url + pkm)
        if (data.status_code == 404):
            raise Exception("Only pokemon can be added to a party")
        if self.size() >= 6:
            raise Exception("A party can only have six Pokemon")
        self.__party.prepend(pkm)
        
    def remove(self,pkm):
        self.__party.remove(pkm)
        
    def pokedex(pkm):
        base_url = "https://pokeapi.co/api/v2/pokemon/"
        data = requests.get(base_url + pkm)
        page = str(data.json()["id"]), str(data.json()["name"]), str(data.json()["types"][0]["type"])
        return page
    
    def size(self):
        return self.__party.size()
        
    def find(pkm):
        base_url = "https://pokeapi.co/api/v2/pokemon/"
        data = requests.get(base_url + pkm + "/encounters")
        return data.json()[0]["location_area"]
    
    def __contains__(self,pkm):
        return self.__party.__contains__(pkm)
    
    def index(self,pkm):
        return self.__party.index(pkm)
    
    #switch pokemon based on index
    def switch(self,val1,val2):
        self.__party.switch(val1,val2)
    
        
        
