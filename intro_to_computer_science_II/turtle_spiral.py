import turtle

myTurtle = turtle.Turtle()
myWin = turtle.Screen()

def drawSpiral(myTurtle, lineLen):
    if lineLen > 0:
        myTurtle.forward(lineLen)
        myTurtle.right(28)
        drawSpiral(myTurtle,lineLen-.1)

drawSpiral(myTurtle,100)
myWin.exitonclick()

"""
def doubler(a_list):
    if a_list == []:
        return []
    else:
        new_list = a_list[-1]
        #new_list.append(item_at_end)
        #new_list.append(item_at_end)
        return doubler(new_list) + (item_at_end,item_at_end)
    
print(doubler([1,2,10,50]))
"""