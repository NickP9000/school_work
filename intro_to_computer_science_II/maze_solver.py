from maze import Maze
from matched_open_close import Stack
from Queue import Queue

"""
The solving method using stacks seems to try and solve in a very linear way.
When I had it solve large.txt, it tended to work on one line of the maze at a time.
I had (and currently have) no set way for the algorithm to disegard already seached tiles.
As a result of this, it (specifically on large.txt) iterates through a lot of already reveal tiles.

The solving method using queue seems to start at the origin and reveals tiles in a pattern, using the origin as the center for the pattern.
Because of how this method works, I am unsure of the exact way it iterates through already revealed tiles, though I'm sure it does.

In all, I am sure that my code could still use refining, particularly in preventing the methods from searching already revealed tiles.
"""

def solve_m_stack(m): #alrorithm that uses stacks to solve the maze
    __found_goal = False
    __maze = Maze()
    __maze.load_from_file(m)
    
    #initializing the stack and putting inn the starting location
    __frontier_stack = Stack()
    __frontier_stack.push(__maze.start_location())
    #loop continues to run if the stack is not empty and the goal has not been found
    while not __frontier_stack.is_empty() and not __found_goal:
        #print for aesthetic
        print(__frontier_stack)
        print(__maze)
        #remove last element on stack and assign it to a variable
        __temp_val = __frontier_stack.pop()
        num1 = __temp_val[0]
        num2 = __temp_val[1]
        #check if the ordered pair has been explored
        if not __maze.is_revealed(num1, num2):
            __maze.explore(num1, num2)
            #checks on what the ordered pair is ensue
            if __maze.explore(num1, num2) == "*":
                print(__maze)
                print("The Stack Maze Solver has solved the maze!")
                __found_goal = True
            if __maze.explore(num1, num2) == "." or __maze.explore(num1, num2) == "o":
                if (num1+1 < __maze.num_columns()):
                    num1 += 1
                    __temp_val = (num1, num2)
                    __frontier_stack.push(__temp_val)
                    num1 -=1
                if (num1 > 0):
                    num1 -= 1
                    __temp_val = (num1, num2)
                    __frontier_stack.push(__temp_val)
                    num1 += 1
                if (num2+1 < __maze.num_rows()):
                    num2 += 1
                    __temp_val = (num1, num2)
                    __frontier_stack.push(__temp_val)
                    num2 -= 1
                if (num2 > 0):
                    num2 -= 1
                    __temp_val = (num1, num2)
                    __frontier_stack.push(__temp_val)
                    
def solve_m_queue(m): #alrorithm that uses queues to solve the maze
    __found_goal = False
    __maze = Maze()
    __maze.load_from_file(m)
    
    #initializing the stack and putting inn the starting location
    __frontier_queue = Queue()
    __frontier_queue.enqueue(__maze.start_location())
    #loop continues to run if the stack is not empty and the goal has not been found
    while not __frontier_queue.is_empty() and not __found_goal:
        #print for aesthetic
        print(__frontier_queue)
        print(__maze)
        #remove last element on queue and assign it to a variable
        __temp_val = __frontier_queue.dequeue()
        num1 = __temp_val[0]
        num2 = __temp_val[1]
        #check if the ordered pair has been explored
        if not __maze.is_revealed(num1, num2):
            __maze.explore(num1, num2)
            #checks on what the ordered pair is ensue
            if __maze.explore(num1, num2) == "*":
                print(__maze)
                print("The Queue Maze Solver has solved the maze!")
                __found_goal = True
            if __maze.explore(num1, num2) == "." or __maze.explore(num1, num2) == "o":
                if (num1+1 < __maze.num_columns()):
                    num1 += 1
                    __temp_val = (num1, num2)
                    __frontier_queue.enqueue(__temp_val)
                    num1 -=1
                if (num1 > 0):
                    num1 -= 1
                    __temp_val = (num1, num2)
                    __frontier_queue.enqueue(__temp_val)
                    num1 += 1
                if (num2+1 < __maze.num_rows()):
                    num2 += 1
                    __temp_val = (num1, num2)
                    __frontier_queue.enqueue(__temp_val)
                    num2 -= 1
                if (num2 > 0):
                    num2 -= 1
                    __temp_val = (num1, num2)
                    __frontier_queue.enqueue(__temp_val)


#solve_m_stack("large.txt")
solve_m_queue("large.txt")