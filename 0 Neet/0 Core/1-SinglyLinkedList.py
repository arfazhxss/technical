class ListNode:
    def __init__(self, val, next_node=None):
        self.val = val
        self.next = next_node

class LinkedList:
    
    def __init__(self):
        self.head = ListNode(-1)
        self.tail = self.head
    
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

    def remove(self, index: int) -> bool:
        i = 0
        cur = self.head 
        while i < index and cur: 
            # "cur"
            # we didn't use cur.next because of the 
            # "cur = cur.next" line where cur is in the
            # left side
            #
            # i < index
            # since "i" isn't at index, 
            # "cur.next" is the one that needs to be 
            # delete/removed
            cur = cur.next
            i += 1
        
        if cur and cur.next:
            # "cur and cur.next"
            # we used cur.next because of the 
            # existance of "cur.next" in the left side
            if cur.next == self.tail:
                self.tail = cur
            cur.next = cur.next.next
            return True
        return False

    def getValues(self) -> List[int]:
        cur = self.head.next
        resList = []

        while cur:
            resList.append(cur.val)
            cur = cur.next
        return resList