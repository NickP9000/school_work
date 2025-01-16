import random

class RobotVacuumAgent:

    def __init__(self,filename):
        """
        init function establishes board, robotRow, robotCol
        :param filename: establishes board
        """
        with open(filename, "r") as file:
            self.board = [[x for x in line.split()] for line in file]

        self.num_spaces   = 0  # number of potential clean/dirty spaces in board
        
        # idea/suggestion: define variables to keep track of the dirty locations
        # introduce a dictionary to store dirty locations with its distance from the robot's current position
        #      eg, 'key' in this dictionary could be (r,c) and 'value' could be distance                
        self.direction =  "" # holds a string representation of the recommended distance for the robot to move
        self.dirt_list = [] #list of all dirt locations
        self.closest_dirt = [0,0]  # for keeping track of the closest dirt location
        
        for r in range(len(self.board)):
            for c in range(len(self.board[r])):
                self.num_spaces += 1
                if self.board[r][c] == '@' or self.board[r][c] == '!': # find the location of the robot
                    self.robotRow = r;
                    self.robotCol = c;
                if(self.board[r][c] == '*'): #find the location of any dirt 
                    self.dirt_list.append([r,c])
                    
        # idea/suggestion: save the locations (row_number: 'r' and column_number: 'c') of the dirty places
        #                  you could save it in self.dirty_spaces
        #    for r in range(len(self.board)):
        #        for c in range(len(self.board[r])):
        #            if self.board[r][c] == '*':
        
        # idea/suggestion: compute the closest location and save it to self.closest_dirt
    
    
    #This method compares the manhattan distance between the robot and all stored dirt spaces and finds the closest dirt
    def find_closest(self):
        closest = 9999999999999
        #search the list of dirt
        for x in range(len(self.dirt_list)):
            #compare location of dirt with current location of robot
            temp = abs(self.robotRow - self.dirt_list[x][0]) + abs(self.robotCol - self.dirt_list[x][1])
            if(temp < closest): #if the location is closest to the robot, change variables based on the location.
                closest = temp
                self.closest_dirt = self.dirt_list[x]
        
        
        
    #find_direction chooses to move the robot in the direction which is farthest from the dirt target i.e. Say robot is (0,0) and dirt
    #is (3,5), it will move right to bring its own y coordinate closer to the y coordinate of the dirt target.
    def find_direction(self):
        #compare x of robot and dirt
        x = self.robotRow - self.closest_dirt[0]
        #compare y of robot and dirt
        y = self.robotCol - self.closest_dirt[1]
        #check if x or y is further
        if(abs(x) > abs(y)):
            #when x is further
            #dirt is down if negative
            if(x < 0):
                self.direction = "down"
            #dirt is up if positive
            else:
                self.direction = "up"
        else:
            #when y is further
            #dirt is right if negative
            if(y < 0):
                self.direction = "right"
            #dirt is left if positive
            else:
                self.direction = "left"
                      
        
    def print(self):
        """
        displays board to console
        """
        for r in range(len(self.board)):
            for c in range(len(self.board[r])):
                print(self.board[r][c], end = ' ')
            print()


    def do_something(self):
        """
        can do two actions: either "suck up dirt" or "move in either of the four directions"
        """
        if self.board[self.robotRow][self.robotCol] == '!':
            self.board[self.robotRow][self.robotCol] = '@'; #just sucked up the dirt
            self.dirt_list.remove([self.robotRow,self.robotCol]) #since dirt was sucked up, remove it from the list
        else:
            
            #strategy: Store coordinates of all dirt. Search which coordinate is closest and move towards it.
            
            #Why is this rational?: The robot wants to be efficient with its movements. By calculating closest dirt before movement,
            #the robot can be assured that it is always moving towards the closest dirt. This way, if the closest dirt changes,
            #it can be flexible and change targets. By using a list of all the dirt locations, the robot does not have to pointlessly
            #search through the entire room, which could become computationally expensive.
            
            #Downsides: If the room is especially dirty, the robot may end up having to search the entire room anyways. However, as the 
            #robot cleans the room in this situation, it would have less to search.
    
            #search for closest dirt
            self.find_closest()
            #find what direction to move
            self.find_direction()
            
            #move based on self.direction
            if(self.direction == "up"):
                self.move_up()
            elif (self.direction == "down"):
                self.move_down()
            elif (self.direction =="left"):
                self.move_left()
            else:
                self.move_right()
                
            
            # 'not-so-intelligent' strategy: randomly move to a location
            # --------------------------------------------------------
            #rand = random.randint(0,3)
            #if rand == 0:
            #    self.move_up()
            #elif rand == 1:
            #    self.move_down()
            #elif rand == 2:
            #    self.move_left()
            #else:
            #    self.move_right()
            # --------------------------------------------------------

            # TBD: you can comment out the above portion of the code and replace it with 
            # a more intelligent strategy to pick the next location where the robot could move.
            # For example, it could be based on the self.closest_dirt
            
                
                

    def out_of_bounds(self, row, col):
        """
        :param row:
        :param col:
        :return: True if (row,col) will be out of bounds of self.board
                otherwise, returns False
        """
        try:
            if row < 0 or row >= len(self.board) or col < 0 or col >= len(self.board[row]):
                return True
            else:
                return False
        except:
            print('exception occurred -- out of bounds')
            return True


    def move_up(self):
        """
        moves robot 1 space up (north)
        :return:
        """
        if not self.out_of_bounds(self.robotRow -1, self.robotCol):
            if self.board[self.robotRow][self.robotCol] == '@':
                self.board[self.robotRow][self.robotCol] = '.'
            elif self.board[self.robotRow][self.robotCol] == '!':
                self.board[self.robotRow][self.robotCol] = '*'
            self.robotRow -= 1
            if self.board[self.robotRow][self.robotCol] == '*':
                self.board[self.robotRow][self.robotCol] = '!'
            elif self.board[self.robotRow][self.robotCol] == '.':
                self.board[self.robotRow][self.robotCol] = '@'
                
        # idea/suggestion: now, re-compute the closest location from the changed robot location
                

    def move_down(self):
        """
        moves robot 1 space down (south)
        :return:
        """
        if not self.out_of_bounds(self.robotRow+1, self.robotCol):
            if self.board[self.robotRow][self.robotCol] == '@':
                self.board[self.robotRow][self.robotCol] = '.'
            elif self.board[self.robotRow][self.robotCol] == '!':
                self.board[self.robotRow][self.robotCol] = '*'
            self.robotRow += 1
            if self.board[self.robotRow][self.robotCol] == '*':
                self.board[self.robotRow][self.robotCol] = '!'
            elif self.board[self.robotRow][self.robotCol] == '.':
                self.board[self.robotRow][self.robotCol] = '@'

        # idea/suggestion: now, re-compute the closest location from the changed robot location
        #                       then save it to self.closest_dirt


    def move_left(self):
        """
        moves robot 1 space left (west)
        :return:
        """
        if not self.out_of_bounds(self.robotRow, self.robotCol-1):
            if self.board[self.robotRow][self.robotCol] == '@':
                self.board[self.robotRow][self.robotCol] = '.'
            elif self.board[self.robotRow][self.robotCol] == '!':
                self.board[self.robotRow][self.robotCol] = '*'
            self.robotCol -= 1
            if self.board[self.robotRow][self.robotCol] == '*':
                self.board[self.robotRow][self.robotCol] = '!'
            elif self.board[self.robotRow][self.robotCol] == '.':
                self.board[self.robotRow][self.robotCol] = '@'

        # idea/suggestion: now, re-compute the closest location from the changed robot location
        #                       then save it to self.closest_dirt


    def move_right(self):
        """
         moves robot 1 space right (east)
         :return:
         """
        if not self.out_of_bounds(self.robotRow, self.robotCol+1):
            if self.board[self.robotRow][self.robotCol] == '@':
                self.board[self.robotRow][self.robotCol] = '.'
            elif self.board[self.robotRow][self.robotCol] == '!':
                self.board[self.robotRow][self.robotCol] = '*'
            self.robotCol += 1
            if self.board[self.robotRow][self.robotCol] == '*':
                self.board[self.robotRow][self.robotCol] = '!'
            elif self.board[self.robotRow][self.robotCol] == '.':
                self.board[self.robotRow][self.robotCol] = '@'

        # idea/suggestion: now, re-compute the closest location from the changed robot location
        #                       then save it to self.closest_dirt


    def utility(self):
        """
        :return: the number of clean spots in the room
        """
        result = 0
        for r in range(len(self.board)):
            for c in range(len(self.board[r])):
                if self.board[r][c] == '.' or self.board[r][c] == '@':
                    result += 1
        return result

    def is_goal(self):
        """
        :return: True if all of the spaces are clean; otherwise, False
        """
        if self.utility() == self.num_spaces:
            return True
        else:
            return False


if __name__ == '__main__':
    # create agent
    agent = RobotVacuumAgent("room2.txt")

    count = 0; # number of time steps

    # run the vacuum until room is clean
    while not agent.is_goal():
        print("Number of moves: ", count)
        agent.print()

        count += 1
        agent.do_something()

    # final state
    print("Completed the task with ", count, " moves.")
    agent.print()