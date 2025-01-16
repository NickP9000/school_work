from Problem import *
import pdb

class EightPuzzle(Problem):
    """ The problem of sliding tiles numbered from 1 to 8 on a 3x3 board,
    where one of the squares is a blank. A state is represented as a tuple of length 9,
    where element at index i represents the tile number  at index i (0 if it's an empty square) """

    def __init__(self, initial, goal=(1, 2, 3, 4, 5, 6, 7, 8, 0)):
        """ Define goal state and initialize a problem """
        self.goal = goal
        self.map = {1:(0,0),2:(0,1),3:(0,2),4:(1,0),5:(1,1),6:(1,2),7:(2,0),8:(2,1),0:(2,2)}
        Problem.__init__(self, initial, goal)

    def find_blank_square(self, state):
        """Return the index of the blank square in a given state"""
        return state.index(0)

    def actions(self, state):
        """ Return the actions that can be executed in the given state.
        The result would be a list, since there are only four possible actions
        in any given state of the environment """

        possible_actions = ['UP', 'DOWN', 'LEFT', 'RIGHT']
        index_blank_square = self.find_blank_square(state)

        if index_blank_square % 3 == 0:
            possible_actions.remove('LEFT')
        if index_blank_square < 3:
            possible_actions.remove('UP')
        if index_blank_square % 3 == 2:
            possible_actions.remove('RIGHT')
        if index_blank_square > 5:
            possible_actions.remove('DOWN')

        return possible_actions

    def result(self, state, action):
        """ Given state and action, return a new state that is the result of the action.
        Action is assumed to be a valid action in the state """

        # blank is the index of the blank square
        blank = self.find_blank_square(state)
        new_state = list(state)

        delta = {'UP': -3, 'DOWN': 3, 'LEFT': -1, 'RIGHT': 1}
        neighbor = blank + delta[action]
        new_state[blank], new_state[neighbor] = new_state[neighbor], new_state[blank]

        return tuple(new_state)

    def goal_test(self, state):
        """ Given a state, return True if state is a goal state or False, otherwise """
        return state == self.goal

    def shuffle(self, number_of_moves):
        """ shuffle the initial state by number_of_moves"""
        import random
        state = self.initial
        for i in range(number_of_moves):
            possible_actions = self.actions(state)
            act = random.choice(possible_actions)
            state = self.result(state,act) #make a random move
        self.initial = state


    def h(self, state):
        """ heuristic cost"""
        cost = 0
        #misplaced tiles version
        # for x in range(len(state)):
        #     if (self.goal[x] != state[x]):
        #         cost += 1
        
        # manhattan distance version
        for num, tile in enumerate(self.map):
            current_tile = self.map[tile]
            goal_tile = self.map[state[num]]
            cost += (abs(current_tile[0]-goal_tile[0]) + abs(current_tile[1]-goal_tile[1]))
            
        return cost
