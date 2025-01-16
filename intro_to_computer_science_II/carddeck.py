#Worked w/Ryan, Marshall, and Emily
#Aid from Professor Manley with errors in shuffle function
import random
class PlayingCard:
    def __init__(self,v,s):
        self.__value = v
        self.__suit = s
        
    def __repr__(self):
        return str(self.__value)+" of "+self.__suit
    
    def __lt__(self, other_card):
        if (self.__value < other_card.__value):
            return True
        else:
            return False
        
class Deck:
    
    def __init__(self):
        self.__card_list = []  #the deck will be initially empty
        
    def put_on_top(self,card):
        self.__card_list.append(card)
        
    def remove_from_top(self):
        return self.__card_list.pop()
    
    def __repr__(self):
        return str(self.__card_list)
    
    def __len__(self):
        return len(self.__card_list)
        
    def shuffle(self):
        temp_deck = []
        random_int = 0
        for i in range(len(self.__card_list)):
            random_int = random.randint(0,len(self)-1)
            temp_deck.append(self.__card_list.pop(random_int))
        self.__card_list = temp_deck
        
    def is_empty(self):
        if self.__card_list == []:
            return True
        else:
            return False
"""
#controlled test case
two_of_clubs = PlayingCard(2,"♣")
ten_of_hearts = PlayingCard(10,"♡")
seven_of_spades = PlayingCard(7,"♠")
four_of_diamonds = PlayingCard(4,"♢")

my_deck = Deck()
my_deck.put_on_top(two_of_clubs)
my_deck.put_on_top(ten_of_hearts)
my_deck.put_on_top(seven_of_spades)
my_deck.put_on_top(four_of_diamonds)
my_deck.shuffle()
print(my_deck)

print( my_deck.remove_from_top() )
print( my_deck.remove_from_top() )
print( my_deck.remove_from_top() )
"""

high_card_deck = Deck()

#create each of the 52 playing cards and put them in the deck
suits = ["♠","♣","♡","♢"]
for s in suits:
    for v in range(2,15):
        curr_card = PlayingCard(v,s)
        high_card_deck.put_on_top(curr_card)
        
#look at the deck both before and after shuffling        
print("Here's the pre-shuffled deck:",high_card_deck)
high_card_deck.shuffle()
print("Here's the deck after the shuffle:",high_card_deck)

#initialize both player's scores to 0
p1score = 0
p2score = 0

#keep going until all cards are dealt out
while not high_card_deck.is_empty():
    
    #draw a card for each player
    p1card = high_card_deck.remove_from_top()
    p2card = high_card_deck.remove_from_top()
    
    print("Player 1:",p1card,", Player 2:",p2card)
    
    #check which player wins this hand
    if p1card < p2card:
        p1score += 1
        print("Player 1 wins this hand.")
    elif p1card > p2card:
        p2score += 1
        print("Player 2 wins this hand.")
    else:
        print("This hand is a draw.")
        
        
#Figure out who wins and display the game-end message
print("Player 1 score:",p1score,", Player 2 score:",p2score) 
if p1score > p2score:
    print("Player 1 wins the game!!!")
elif p2score > p1score:
    print("Player 2 wins the game!!!")
else:
    print("The game is a tie :(")