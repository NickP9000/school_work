"""
Uniform Cost Search (UCS)

implements a Uniform Cost Search as defined by the Russel-Norvig text

"""

from queue import PriorityQueue
from Node import *
import time

class UniformCostSearch():

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
        return self.ucs(self.problem.initial)

    """
    Conducts Uniform Cost Search from a given start state.
    state: the start state for the search
    """
    def ucs(self, startState):
        startTime = time.time()

        # create a node for the state; assuming root has path cost of 0
        root = Node(startState, path_cost = 0)
        frontier = PriorityQueue()

        frontier.put((0, root))

        frontierStates = {}
        frontierStates[root.state] = root

        explored = set()
        while not frontier.empty():
            element = frontier.get()
            node = element[1]

            self.nodesSearched += 1
            if self.problem.goal_test(node.state):
                self.timeSpent = time.time() - startTime
                return node

            explored.add(node.state)

            #expand node in frontier
            for action in self.problem.actions(node.state):
                nextState = self.problem.result(node.state, action)

                if nextState not in explored:
                    child = Node(state=nextState, parent=node,
                                  path_cost=self.problem.path_cost(node.path_cost, node.state, action, nextState),
                                  action=action)

                    if child.state not in frontierStates or frontierStates[child.state].path_cost > child.path_cost:
                        frontier.put((child.path_cost, child))
                        frontierStates[child.state] = child

        return None







