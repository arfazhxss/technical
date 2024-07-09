class ListNode:
    def __init__(self, val, next_node=None):
        self.val = val
        self.next = next_node

class LinkedList:
    
    def __init__(self):
        self.head = ListNode(-1)                    # -1 is not part of the linked list
        self.tail = self.head                       # [ -1, firstNode, SecondNode,..., LastNode/Tail ]
    
    def get(self, index: int) -> int:
        cur = self.head.next
        i = 0
        while cur:
            if i == index:
                return cur.val
            i += 1
            cur = cur.next
        return -1

    def insertHead(self, val: int) -> None:
        newNode = ListNode(val)
        newNode.next = self.head.next
        self.head.next = newNode
        if not newNode.next:
            self.tail = newNode

    def insertTail(self, val: int) -> None:
        self.tail.next = ListNode(val)
        self.tail = self.tail.next

    def remove(self, index: int) -> bool:           # "cur"
        i = 0                                       # we didn't use cur.next because of the 
        cur = self.head                             # "cur = cur.next" line where cur is in the
                                                    # left side
        while i < index and cur:                    
            cur = cur.next                          # i < index
            i += 1                                  # since "i" isn't at index, 
                                                    # "cur.next" is the one that needs to be 
        if cur and cur.next:                        # delete/removed
            if cur.next == self.tail:
                self.tail = cur                     # "cur and cur.next"
            cur.next = cur.next.next                # we used cur.next because of the 
            return True                             # existance of "cur.next" in the left side
        return False

    def getValues(self) -> List[int]:
        cur = self.head.next
        resList = []

        while cur:
            resList.append(cur.val)
            cur = cur.next
        return resList
    

# class ListNode:
#     def __init__(self, val, nextNode):
#         self.val = val
#         self.next = nextNode

# class LinkedList:
    
#     def __init__(self):
#         self.head = ListNode(-1)
#         self.tail = self.head
    
#     def get(self, index: int) -> int:
#         curr = self.head.next
#         i = 0
#         while curr:
#             if (i == index):
#                 return curr.val
#             curr = curr.next
#             i += 1
#         return -1

#     def insertHead(self, val: int) -> None:
#          curr = ListNode(val)
#          curr.next = self.head.next
#          self.head.next = curr
#          if not curr.next:
#              self.tail = curr

#     def insertTail(self, val: int) -> None:
#         self.tail.next = ListNode(val)
#         self.tail = self.tail.next

#     def remove(self, index: int) -> bool:
#         curr = self.head
#         i = 0
#         while (i < index) and curr:
#             curr = curr.next
#             i += 0
#         if curr and curr.next:
#             if self.tail == curr.next:
#                 self.tail = curr
#             curr.next = curr.next.next
#             return True
#         return False

#     def getValues(self) -> List[int]:
#         curr = self.head.next
#         resList = []
#         while curr:
#             resList.append(curr.val)
#             curr = curr.next
#         return resList