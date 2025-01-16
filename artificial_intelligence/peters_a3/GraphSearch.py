"""
Graph Search

implements a Graph Search with a frontier and an explored set
"""

from collections import deque
from Node import *
import time

class GraphSearch():
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
    """
    def search(self):
        return self.graphsearch(self.problem.initial)

    """
    Conducts Breadth First Graph Search from a given start state.
    state: the start state for the search
    """
    def graphsearch(self, startState):
        startTime = time.time()

        # create a node for the state
        root = Node(startState)

        # create the frontier and expanded sets
        frontier = deque([root])
        explored = set()           # this data-structure maintains nodes that have already been expanded/explored

        while len(frontier) > 0:
            node = frontier.popleft()
            self.nodesSearched += 1
            if self.problem.goal_test(node.state):
                self.timeSpent = time.time() - startTime
                return node

            explored.add(node.state)

            #expand node in frontier
            for action in self.problem.actions(node.state):
                nextState = self.problem.result(node.state, action)
                child = Node(state=nextState, parent=node,
                                  path_cost=self.problem.path_cost(node.path_cost, node.state, action, nextState),
                                  action=action)

                # you don't need to add a node into the 'frontier' if it has been explored before (saves us memory/time)                
                if child.state not in explored and child not in frontier:
                    frontier.append(child)

        self.timeSpent = time.time() - startTime
        return None