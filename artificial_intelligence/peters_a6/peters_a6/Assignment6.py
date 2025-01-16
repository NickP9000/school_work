from Game import *
import math
import sys

NUMBER_OF_ROWS = 6
NUMBER_OF_COLS = 7

class ConnectFourGame(Game) :

    def __init__(self) :
        self.initial = [['.'] * NUMBER_OF_COLS for _ in range(NUMBER_OF_ROWS)]



    def display(self, state):
        """Print or otherwise display the state."""
        print()
        for row in range(NUMBER_OF_ROWS-1,-1,-1):
            print("|\t",end='')
            for col in range(NUMBER_OF_COLS):
                print(state[row][col],"\t", end="")
            print("|")

        print("-----------------------------------------------------------------")
        print("\t0\t1\t2\t3\t4\t5\t6 ")
        
    def drop_piece(self, state, row, col, piece):
        state[row][col] = piece

    def is_valid_location(self, state, col):
        if col <0 or col >= NUMBER_OF_COLS:
            return False
        else:
            return state[NUMBER_OF_ROWS - 1][col] == '.'

    def get_next_open_row(self, state, col):
        for r in range(NUMBER_OF_ROWS):
            if state[r][col] == '.':
                return r
        return NUMBER_OF_ROWS

    def winning_move(self, board, piece):
        # Check horizontal locations for win
        for c in range(NUMBER_OF_COLS - 3):
            for r in range(NUMBER_OF_ROWS):
                if board[r][c] == piece and board[r][c + 1] == piece and board[r][c + 2] == piece and board[r][
                    c + 3] == piece:
                    return True

        # Check vertical locations for win
        for c in range(NUMBER_OF_COLS):
            for r in range(NUMBER_OF_ROWS - 3):
                if board[r][c] == piece and board[r + 1][c] == piece and board[r + 2][c] == piece and board[r + 3][
                    c] == piece:
                    return True

        # Check positively sloped diaganols
        for c in range(NUMBER_OF_COLS - 3):
            for r in range(NUMBER_OF_ROWS - 3):
                if board[r][c] == piece and board[r + 1][c + 1] == piece and board[r + 2][c + 2] == piece and \
                        board[r + 3][c + 3] == piece:
                    return True

        # Check negatively sloped diaganols
        for c in range(NUMBER_OF_COLS - 3):
            for r in range(3, NUMBER_OF_ROWS):
                if board[r][c] == piece and board[r - 1][c + 1] == piece and board[r - 2][c + 2] == piece and \
                        board[r - 3][c + 3] == piece:
                    return True
        return False

    def terminal_test(self, state):
        return self.winning_move(state, "x") or self.winning_move(state, "o") or len(self.actions(state)) == 0


    def getEnemyPlayer(self,player):
        # return the opposite of player
        if player == 'x':
            return 'o'
        else:
            return 'x'


    def undo(self, state, move):
        row = self.get_next_open_row(state, move)
        state[row-1][move] = '.'
        return state


    def actions(self, state):
        # returns list of numbers corresponding to possible moves        
        
        # TO DO        
        # YOUR CODE ...
        valid_locations = []
        for c in range(NUMBER_OF_COLS):
            if self.is_valid_location(state,c):
                valid_locations.append(c)
        return valid_locations


    def result(self, state, move, player):
        """Return the state that results from making a move from a state."""
        # TO DO
        # YOUR CODE ...
        r = self.get_next_open_row(state, move)
        state[r][move] = player       
        return state


    #1 if AI win, -1 if player win, 0 if draw
    def utility(self, state, player):
        """Return the value of this final state to player."""

        
        if self.winning_move(state, 'o'):
            return 1
        elif self.winning_move(state, 'x'):
            return -1
        else:       
            return 0
        
        # enemy_player = self.getEnemyPlayer(player)
        # val = 0
        # # Check horizontal locations for streaks
        # for c in range(NUMBER_OF_COLS - 3):
        #     for r in range(NUMBER_OF_ROWS):
        #         # add for player
        #         if state[r][c] == player and state[r][c + 1] == player:
        #             val += 10
        #         if state[r][c] == player and state[r][c + 1] == player and state[r][c + 2] == player:
        #             val += 100
        #         if state[r][c] == player and state[r][c + 1] == player and state[r][c + 2] == player and state[r][
        #             c + 3] == player:
        #             val += 10000
                    
        #         # subtract for enemy_player
        #         if state[r][c] == enemy_player and state[r][c + 1] == enemy_player:
        #             val += -10
        #         if state[r][c] == enemy_player and state[r][c + 1] == enemy_player and state[r][c + 2] == enemy_player:
        #             val += -100
        #         if state[r][c] == enemy_player and state[r][c + 1] == enemy_player and state[r][c + 2] == enemy_player and state[r][
        #             c + 3] == enemy_player:
        #             val += -10000

        # # Check vertical locations for streaks
        # for c in range(NUMBER_OF_COLS):
        #     for r in range(NUMBER_OF_ROWS - 3):
        #         # add for player
        #         if state[r][c] == player and state[r+1][c] == player:
        #             val += 10
        #         if state[r][c] == player and state[r+1][c] == player and state[r+2][c] == player:
        #             val += 100
        #         if state[r][c] == player and state[r+1][c] == player and state[r+2][c] == player and state[r+3][
        #             c] == player:
        #             val += 10000
                    
        #         # subtract for enemy_player
        #         if state[r][c] == enemy_player and state[r+1][c] == enemy_player:
        #             val += -10
        #         if state[r][c] == enemy_player and state[r+1][c] == enemy_player and state[r+2][c] == enemy_player:
        #             val += -100
        #         if state[r][c] == enemy_player and state[r+1][c] == enemy_player and state[r+2][c] == enemy_player and state[r+3][
        #             c] == enemy_player:
        #             val += -10000

        # # Check positively sloped diagonals for streaks
        # for c in range(NUMBER_OF_COLS - 3):
        #     for r in range(NUMBER_OF_ROWS - 3):
        #         # add for player
        #         if state[r][c] == player and state[r+1][c+1] == player:
        #             val += 10
        #         if state[r][c] == player and state[r+1][c+1] == player and state[r+2][c+2] == player:
        #             val += 100
        #         if state[r][c] == player and state[r+1][c+1] == player and state[r+2][c+2] == player and \
        #                 state[r+3][c+3] == player:
        #             val += 10000
                    
        #         # subtract for enemy_player
        #         if state[r][c] == enemy_player and state[r+1][c+1] == enemy_player:
        #             val += -10
        #         if state[r][c] == enemy_player and state[r+1][c+1] == enemy_player and state[r+2][c+2] == enemy_player:
        #             val += -100
        #         if state[r][c] == enemy_player and state[r+1][c+1] == enemy_player and state[r+2][c+2] == enemy_player and \
        #                 state[r+3][c+3] == enemy_player:
        #             val += -10000

        # # Check negatively sloped diagonals for streaks
        # for c in range(NUMBER_OF_COLS - 3):
        #     for r in range(3, NUMBER_OF_ROWS):
        #         # add for player
        #         if state[r][c] == player and state[r-1][c+1] == player:
        #             val += 10
        #         if state[r][c] == player and state[r-1][c+1] == player and state[r-2][c+2] == player:
        #             val += 100
        #         if state[r][c] == player and state[r-1][c+1] == player and state[r-2][c+2] == player and \
        #                 state[r-3][c+3] == player:
        #             val += 10000
                
        #         # subtract for enemy_player
        #         if state[r][c] == enemy_player and state[r-1][c+1] == enemy_player:
        #             val += -10
        #         if state[r][c] == enemy_player and state[r-1][c+1] == enemy_player and state[r-2][c+2] == enemy_player:
        #             val += -100
        #         if state[r][c] == enemy_player and state[r-1][c+1] == enemy_player and state[r-2][c+2] == enemy_player and \
        #                 state[r-3][c+3] == enemy_player:
        #             val += -10000
        
        # return val
            
        
    def minimax(self, state, player, depth=4, alpha = -sys.maxsize - 1, beta = sys.maxsize):
        """
        Without alhpa beta pruning, minimax acts as a purely DFS algorithm. This means that it can be very costly, especially
        if you have high depth. Alpha beta pruning prunes off branches in the searh tree which will not lead to a better result.
        Because the algorithm is aiming for the maximal play, we can prune off branches which, in max phases, contain a cost
        greater than beta. We can prune off branches in min phases which contain a cost less alpha. This leads to a noticeable
        speed-up as we do not have to search as much of the game tree.
        """
        bestMove = -1
        if (depth == 0 or self.terminal_test(state)):
            return self.utility(state, player), -1
            
        # max phase if player is o
        if(player == "o"):
            best = -sys.maxsize - 1
            for one_action in self.actions(state):
                one_state = [row[:] for row in state]
                self.result(one_state, one_action, player)
                local_cost = self.minimax(one_state, self.getEnemyPlayer(player), depth-1)[0]
                
                if (local_cost > best):
                    best = local_cost
                    bestMove = one_action
                    
                if (local_cost >= beta):
                    break
                
                alpha = max(alpha, local_cost)
        # min phase if player is x
        else:
            best = sys.maxsize
            for one_action in self.actions(state):
                one_state = [row[:] for row in state]
                self.result(one_state, one_action, player)
                local_cost = self.minimax(one_state, self.getEnemyPlayer(player), depth-1)[0]
                
                if (local_cost < best):
                    best = local_cost
                    bestMove = one_action
                    
                if(local_cost <= alpha):
                    break
                
                beta = min(beta, local_cost)

        return best, bestMove



    def play(self, state):
        game_over = False
        turn = 2
        while not game_over:
            self.display(state)
            if turn == 1:
                print("PLAYER 1")
                col = int(input("Where to drop a piece?"))
                if self.is_valid_location(state, col):
                    row = self.get_next_open_row(state, col)
                    self.drop_piece(state, row, col, 'x')
                    turn = 2
                else:
                    print('not a valid location; try again')

                if self.winning_move(state, 'x'):
                    print("Player 1 wins!")
                    game_over = True

            else:

                print("AI")
                val, col = self.minimax(state, "o", 4)
                print(val,col)
                if self.is_valid_location(state, col):
                    row = self.get_next_open_row(state, col)
                    self.drop_piece(state, row, col, 'o')
                    turn = 1
                else:
                    print('not a vaild location; try again')

                if self.winning_move(state, 'o'):
                    print("AI wins!")
                    game_over = True

            if self.terminal_test(state):
                game_over = True
        self.display(state)





# 2 player game
#play the game
game = ConnectFourGame()
game.play(game.initial)