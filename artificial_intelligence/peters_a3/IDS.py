from collections import deque
from Node import *
import time

class IDS():
    """
    Creates a new Graph Search object

    model: a Problem model of the environment
    """
    def __init__(self, problem):
        # save the params
        self.problem = problem
        self.nodesSearched = 0
        self.timeSpent = 0

    """
    Searches for a path from the start state to a goal state using the Problem given
    to the constructor
    Conducts Iterative Deepening Graph Search from a given start state.
    """
    def search(self):
        startTime = time.time()
        iteration = 1000000 #amount of iterations (also is the max depth the ids will search for)
        end_state = None 
        #run a depth limited search iteration times
        for md in range(0, iteration): #md will control max_depth
            end_state = self.dls(self.problem.initial, md) 
            if(end_state != None): #end loop early if a goal node is found
                break
        self.timeSpent = time.time() - startTime
        return end_state
            

    """
    Conducts a Depth Limited Graph Search from a given start state,
    state: the start state for the search
    depth limited with 
    """
    def dls(self, startState, max_depth):


        # create a node for the state
        root = Node(startState)

        # create the frontier
        frontier = deque([root])
        
        
        while len(frontier) > 0:
            node = frontier.pop()
            self.nodesSearched += 1
            if self.problem.goal_test(node.state):
                return node

            # expand node in frontier
            for action in self.problem.actions(node.state):
                nextState = self.problem.result(node.state, action)
                child = Node(state=nextState, parent=node,
                             path_cost=self.problem.path_cost(node.path_cost, node.state, action, nextState),
                             action=action)
                
                #don't add a node if it's past our max_depth
                #also don't add a node if it's already in the frontier
                if(node.depth <= max_depth and child not in frontier):
                    frontier.append(child)

        return None