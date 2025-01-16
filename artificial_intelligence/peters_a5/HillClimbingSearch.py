"""
HillClimbingSearch
"""
import time
from NQueensProblem import *

class HillClimbingSearch():

    def __init__(self, problem):
        # save the
        self.problem = problem
        self.rounds = 0
        self.timeSpent = 0

    """
    Searches for a path from the start state to a goal state using the Problem given
    to the constructor
    """
    def search(self):
        return self.hillclimb(self.problem.initial)

    """
    Conducts Hill Climbing Search from a given start state.
    startState: the start state for the search
    """
    def hillclimb(self, startState):
        startTime = time.time()

        # create a node for the state;
        state = startState
        bestCost = self.problem.cost(state)

        # TODO:
        # implement Hill Climbing Algorithm here
        # return state with a local minimum
        max_iter = 10000
        completion = 0
        for x in range(0, max_iter):
            #Optional verbosity if running with a high max_iter value or a high N-Queens and the min is a local min
            # if(x%int(0.25* max_iter) == 0):
            #     completion += 25
            #     print(f"{completion}% complete")
                
            # get all possible actions from the current state
            possible_actions = self.problem.actions(state)
            
            # search for the action with the lowest cost
            best_action = ()
            min_cost = self.problem.cost(possible_actions[0])
            for action in range(1,len(possible_actions)):
                current_cost = self.problem.cost(possible_actions[action])
                if(current_cost < min_cost):
                    min_cost = current_cost
                    best_action = possible_actions[action]

            # set the current state to the action with the lowest cost
            state = best_action
            # check if the loop can end early
            if(self.problem.cost(state) == 0):
                break  
            
            #round has completed
            self.rounds += 1 
        

        self.timeSpent = time.time() - startTime

        return state





