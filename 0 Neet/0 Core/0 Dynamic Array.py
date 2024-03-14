class DynamicArray:
    def __init__(self, capacity):
        # if (capacity < 10):
        #     self.capacity = 10
        # else:
        #     self.capacity = capacity
        self.capacity = capacity
        self.array = [0] * self.capacity
        self.length = 0

    def get(self, i: int) -> int:
        # if (i < self.getSize()):
        #     self.resize()
        return self.array[i]

    def set(self, i: int, n: int) -> None:
        if (i <= self.getCapacity()):
            self.array[i] = n
    def pushback(self, n: int) -> None:
        self.incSize()
        if (self.getCapacity() < self.getSize()):
            self.resize()
        self.array[self.getSize()-1] = n

    def popback(self) -> int:
        temp = self.array[self.getSize()-1]
        self.array[self.getSize()-1]=0
        self.decSize()
        return temp

    def resize(self) -> None:
        self.capacity = self.capacity * 2
        newArr = [0] * self.capacity
        for i in range(self.getSize()-1):
            newArr[i] = self.array[i]
        self.array = newArr

    def incSize(self) -> None:
        self.length += 1

    def decSize(self) -> None:
        self.length -= 1

    def getSize(self) -> int:
        return self.length

    def getCapacity(self) -> int:
        return self.capacity
    
    def reset(self) -> None:
        self.capacity = 5
        self.array = [0] * self.capacity
        self.length = 0

# Test Cases
# Dynamic Array
commands = [
    "Array", 1,
    "getSize",
    "getCapacity",
    "pushback", 128,
    "pushback", 829,
    "pushback", 632,
    "pushback", 983,
    "pushback", 654,
    "pushback", 122,
    "pushback", 476,
    "pushback", 888,
    "pushback", 666,
    "pushback", 999,
    "getSize",
    "getCapacity",
    "pushback", 2,
    "getSize",
    "getCapacity",
    "get", 1,
    "set", 405, 3333333,
    "set", 9, 3333333,
    "get", 1,
    "popback",
    "getSize",
    "getCapacity",
    "reset"

    "Array", 3, 
    "pushback", 1, 
    "pushback", 2, 
    "pushback", 3, 
    "get", 0, 
    "get", 1, 
    "get", 2,
    "reset"

    "Array", 4, 
    "pushback", 1, 
    "set", 0, 0, 
    "pushback", 2, 
    "get", 0, 
    "get", 1, 
    "getCapacity", 
    "popback",
    "reset"
]

dynamic_array = None
output = []

for i, command in enumerate(commands):
    if command == "Array":
        dynamic_array = DynamicArray(commands[i + 1])
        output.append(None)
    elif command == "getSize":
        output.append(dynamic_array.getSize())
    elif command == "getCapacity":
        output.append(dynamic_array.getCapacity())
    elif command == "pushback":
        dynamic_array.pushback(commands[i+1])
        output.append(None)
    elif command == "popback":
        output.append(dynamic_array.popback())
    elif command == "get":
        output.append(dynamic_array.array[commands[i+1]])
    elif command == "set":
        dynamic_array.set(commands[commands.index(command) + 1], commands[commands.index(command) + 2])
    elif command == "reset":
        print("TESTETSThsbbvhvbfdbdh")
        dynamic_array.reset()
        output=[]

print("\n---\n\tOUTPUT: \t", output)
print("\tMAIN-ARRAY: \t", dynamic_array.array)
print("\tSize: \t\t", dynamic_array.getSize())
print("\tCapacity: \t", dynamic_array.getCapacity(),"\n-")