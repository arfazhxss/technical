# Your last Python3 code is saved below:

# # Warmup

# # Implement this!
# def absoluteValue(value):
#   if (value<0):
#     return -value
#   elif (value>0):
#     return value
#   else:
#     return 0


# correct1 = absoluteValue(3) == 3 # false
# correct2 = absoluteValue(-3) == 3 #false
# correct3 = absoluteValue(0) == 0 # true
# correct = correct1 and correct2 and correct3
# print("Warmup correct:", correct)
# print(correct1, correct2, correct3)

# # Question 1

# # Implement this!
# def sumOfArray(array):
#     total=0
#     for i, val in enumerate(array):
#       total+=val
#     return total


# array = [1, 2, 4, 8, 15]
# correct = sumOfArray(array) == 30
# print("\nQuestion 1 correct:", correct)

# Question 2

# Consider an Acyclic Directed graph as represented by the Node class:

# - `name` corresponds to a string var that identifies the node
# - `connections` corresponds to an array of nodes which connect itself to each node in the list

# Write a function that determines if a path exists between the node instance and another node name given as a string.
# A node will not be considered connected to itself unless it is explicitly linked via the `connections` array.
# We also don't consider nodes connected in the opposing direction connected.

# See a diagram of the test graph here:
# https:ocs.google.com/document/d/1aSvCJ77OqDlnG3rWqG3n8tIOfPAxtjeZMRAInEalLbY/edit?usp=sharing

class Node:
    def __init__(self, name, connections):
        self.name = name
        self.connections = connections


# Implement this!
def pathExists(startNode, destNode):
    check = False
    for node in startNode.connections:
        if (node!=None) and (check==False) and (node.name == destNode.name):
            return True
        elif (node!=None) and (check==False): 
            check = pathExists(node, destNode)
    return check

h = Node("h", [])
e = Node("e", [])
f = Node("f", [e])
g = Node("g", [e])
d = Node("d", [e, h])
b = Node("b", [d])
c = Node("c", [])
a = Node("a", [b, c])


aFromA = pathExists(a, a)
eFromA = pathExists(a, e)
gFromE = pathExists(e, g)
hFromF = pathExists(f, h)
hFromA = pathExists(a, h)
print("hFromA:",hFromA)
correct = (not aFromA) and eFromA and (not gFromE) and (not hFromF) and hFromA
print("\nQuestion 2:")
print(f"aFromA: {aFromA}, should be False\neFromA: {eFromA}, should be True\ngFromE: {gFromE}, should be False\nhFromF: {hFromF}, should be False\nhFromA: {hFromA}, should be True")
print("\nQuestion 2 correct:", correct)
