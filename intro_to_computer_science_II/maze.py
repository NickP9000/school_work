
class Maze:
    
    def __init__(self):
        """
        creates an empty maze
        """
        self.__board = []
        self.__revealed = []
        self.__start_row = -1
        self.__start_col = -1
        
    def is_revealed(self, col, row):
        """
        Parameters:
            col: a column on the map
            row: a row on the map
        Returns: a boolean, whether or not the given location
            has already been revealed on the map
        """
        return self.__revealed[row][col]
        
    def start_location(self):
        """
        Parameters: none
        Returns: a tuple with the column and row of the maze's starting location
        """
        return self.__start_col, self.__start_row
        
    def num_rows(self):
        """
        Parameters: none
        Returns: the number of rows in this maze
        """
        return len(self.__board)
    
    def num_columns(self):
        """
        Parameters: none
        Returns: the number of columns in this maze
        """
        if self.__board == []:
            return 0
        else:
            return len(self.__board[0])

        
    def load_from_file(self,filename):
        """
        Parameters: filename: the name of the file with the maze map to load
        Returns: none
        """
        self.__board = []
        self.__revealed = []
        self.__start_row = -1
        self.__start_col = -1
        with open(filename,'r') as mazefile:
            mazelines = mazefile.readlines()
            first_row_size = len(mazelines[0])-1 #-1 becuase of the newline
            for line in mazelines:
                line = line.rstrip()
                if len(line) != first_row_size:
                    raise Exception("Not all rows have the same size in",filename)
                self.__board.append(list(line))
                self.__revealed.append([False]*first_row_size)
                
        for row in range(self.num_rows()):
            for col in range(self.num_columns()):
                if self.__board[row][col] == 'o': #start position
                    #self.__revealed[row][col] = True #start location not initially revealed
                    self.__start_row = row
                    self.__start_col = col
                    
    def __repr__(self):
        """
        Parameters: none
        Returns: a string representing the maze's map as it has been revealed so far
        """
        mazestr = "\n"+str(self.__start_col)+", "+str(self.__start_row)+" is the starting location.\n"
        for row in range(self.num_rows()):
            for col in range(self.num_columns()):
                if self.__revealed[row][col]:
                    mazestr += self.__board[row][col]
                else:
                    mazestr += "?"
            mazestr += "\n"
        
        return mazestr
    
    def full_map(self):
        """
        Parameters: none
        Returns: a string representing the maze's full map without any hiding of the location
        that haven't been explored
        """
        mazestr = ""
        for row in range(self.num_rows()):
            for col in range(self.num_columns()):
                mazestr += self.__board[row][col]
            mazestr += "\n"
        return mazestr
    
    def explore(self,col,row):
        """
        Parameters:
            col: a column on the map
            row: a row on the map
        Returns: the character on the map in the location given by the parameters
            o is the starting location
            * is the goal location
            # is a wall
            . is an open location in the map
        """
        if self.legal_move(col,row):
            self.__revealed[row][col] = True
            return self.__board[row][col]
        else:
            raise Exception("You cannot explore "+str(col)+","+str(row)+" because it is either not on the board or it does not have an adjacent location you can explore from.") 
    
    def legal_move(self,col,row):
        """
        Parameters:
            col: a column on the map
            row: a row on the map
        Returns: a Boolean, whether or not that location given by the parameters can be explored
        """
        #check if this is a spot on the board
        if row < 0 or row >= self.num_rows() or col < 0 or col >= self.num_columns():
            return False
        
        #you can always explore the start location
        if col == self.__start_col and row == self.__start_row:
            return True
        
        #check how many neighbor positions have been revealed
        revealed_neighbors = 0
        if row - 1 >= 0 and self.__revealed[row-1][col] and self.__board[row-1][col] != "#":
            revealed_neighbors += 1
        if row + 1 < self.num_rows() and self.__revealed[row+1][col] and self.__board[row+1][col] != "#":
            revealed_neighbors += 1
        if col - 1 >= 0 and self.__revealed[row][col - 1] and self.__board[row][col - 1] != "#":
            revealed_neighbors += 1
        if col + 1 < self.num_columns() and self.__revealed[row][col+1] and self.__board[row][col+1] != "#":
            revealed_neighbors += 1
        if self.__revealed[row][col] and self.__board[row][col] != "#": #if this space is already revealed and not a wall, it's legal
            revealed_neighbors += 1
            
        #this is a legal move if at least one neighbor has been revealed
        return revealed_neighbors >= 1
  
    


    