from NQueensProblem import *
from HillClimbingSearch import *

# create the problem model

nqueens = NQueensProblem((1,1,10,2,4,5,10,4,5,3,10,11,11,2,14,0))

print("==============")
# search using a Hill Climbing Search
myHCSearch = HillClimbingSearch(nqueens)
state = myHCSearch.search()

print("Number of rounds:", myHCSearch.rounds)
print("solution: ", state)
print("total cost .. ", nqueens.cost(state))
print("Time Spent with Hill Climbing search:", myHCSearch.timeSpent)

print("==============")