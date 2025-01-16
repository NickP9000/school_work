class Edge:
 
    def __init__(self, start, end, weight):
        if(start == end and weight != 0):
            raise IndexError("No self-edges allowed")
        self.__s = start # An integer representing a vertex index
        self.__e = end # An integer representing a vertex index
        self.__w = weight #An integer representing an edge weight between the vertices
 
    def getWeight(self):
        return self.__w
    
    def __eq__(self,other):
        if (self.__e == other.__e and self.__s == other.__s and self.__w == other.__w):
            return True
        else:
            return False
    
    def __repr__(self):
        return str(self.__s) + " --("+ str(self.__w) +")--> " +str(self.__e)
    

class Graph:
    def __init__(self,n):
        self.__numVertices = n
        self.matrix = [ [ float('inf') for i in range(n+1) ] for j in range(n+1) ] 
 
    def getNumVert(self):
        return self.__numVertices
 
    def __repr__(self):
        return str(self.matrix)
 
    def __str__(self):
        return '\n'.join([','.join(str(c) for c in row) for row in self.matrix])
    

def Dijkstra(W):
    F = [] #The list of edges to be constructed, in the order in which they are discovered.
    n = W.getNumVert()
    vnear = None
    touch = [None] * (n+1) #Again, the 0 index entry is meaningless
    length = [None] * (n+1)
 
    for i in range(2,n+1): #Note that this way of using range(x,y) specifies a start and end index with default increments of 1. Not the same as range(n-2).
        touch[i] = 1
        length[i] = W.matrix[1][i]
    
 
    for i in range(1,n): # remember the loop indices seem a little different from the pseudocode, 
        #because we have the extra row and column in W.
 
        min = float('inf')
 
        #TODO: Implement the rest of the algorithm.
        for j in range(2,n+1):
            if(0 < length[j] < min):
                min = length[j]
                vnear = j
        
        F.append(Edge(touch[vnear], vnear, W.matrix[touch[vnear]][vnear]))
        print(F)
        
        for j in range(2,n+1):
            if(length[vnear] + W.matrix[vnear][j]  < length[j]):
                length[j] = length[vnear] + W.matrix[vnear][j]
                touch[j] = vnear    
        
        length[vnear] = -1
 
    return F


W = Graph(7)
W.matrix[1][2] = 5
W.matrix[2][1] = 5

W.matrix[1][7] = 10
W.matrix[7][1] = 10

W.matrix[1][6] = 7
W.matrix[6][1] = 7

W.matrix[2][3] = 3
W.matrix[3][2] = 3

W.matrix[2][7] = 11
W.matrix[7][2] = 11

W.matrix[3][4] = 6
W.matrix[4][3] = 6

W.matrix[3][7] = 9
W.matrix[7][3] = 9

W.matrix[4][5] = 2
W.matrix[5][4] = 2

W.matrix[4][7] = 15
W.matrix[7][4] = 15

W.matrix[5][6] = 4
W.matrix[6][5] = 4

W.matrix[5][7] = 14
W.matrix[7][5] = 14

W.matrix[6][7] = 8
W.matrix[7][6] = 8

for i in range(W.getNumVert()):
    W.matrix[i][i]=0
    
print(Dijkstra(W)) 