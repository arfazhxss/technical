from ast import List

class Solution:
    def containsDuplicate (self, nums: List[int]) -> bool:
        hashset = set()                 # normal for setting hashset

        for n in nums:
            if n in hashset:
                return True
            hashset.add(n)

        return False