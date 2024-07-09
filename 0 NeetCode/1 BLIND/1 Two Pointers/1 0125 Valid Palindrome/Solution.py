class Solution:
    # Cheating Solution
    # def isPalindrome (self, s: str) -> bool:
    #     newStr = ""
    #     for c in s:
    #         if c.isalnum():
    #             newStr += c.lower()
    #     return newStr == newStr[::-1]
    
    # Memory Efficient Solution
    def isPalindrome (self, s: str) -> bool:
        l, r = 0, len(s) - 1

        while l < r and not self.alphaNum(s[l]):
            l += 1

        while r > 1 and not self.alphaNum(s[r]):
            r -= 1

        while l < r:
            if s[l].lower() != s[r].lower():
                return False
        
        l, r = l + 1, r - 1

        return True

    def alphaNum(self, c):
        return ((ord('A') <= ord(c) <= ord('Z')) or (ord('a') <= ord(c) <= ord('z')) or (ord(0) <= ord(c) <= ord(9)))
    
    def isPalindrome2 (self, s: str) -> bool:
        ss=[char.lower() for char in s[0:len(s)//2] if char.isalnum()]
        tt = [char.lower() for char in s[len(s)//2:][::-1] if char.isalnum()]
        for i, char in enumerate(tt):
            if (i<len(ss)) and (char != ss[i]):
                return False
        return True