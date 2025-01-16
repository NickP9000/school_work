# demonstration of recursion with depth

def myfunction(output, depth):
    if depth == 0:
        return output + "! done at depth " + str(depth)
    else:
        print("Doing some computation at depth level", depth)
        val = myfunction(output, depth -1)
        return val

res = myfunction("woot", 5)
print(res)

