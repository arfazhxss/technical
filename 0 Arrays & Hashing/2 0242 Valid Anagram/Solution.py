class Solution1:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        
        countS, countT = {}, {}
        # countS -> occurance of each character in string S
        # countT -> occurance of each character in string T
        # We want to know if S is an anagram for T

        for i in range(len(s)):
            countS[s[i]] = 1 + countS.get(s[i], 0) 
            countT[t[i]] = 1 + countT.get(t[i], 0) 
        
        # iterating through the keys
        for c in countS: 
            if countS[c] != countT.get(c, 0): 
                return False
        
        # Dictionary Test
        # if s == "anmnagramgr":
        #     print("countS:", countS)

        return True

def test_case_1():
    sol = Solution1()
    s = "listen"
    t = "silent"
    assert sol.isAnagram(s, t) == True

def test_case_2():
    sol = Solution1()
    s = "hello"
    t = "world"
    assert sol.isAnagram(s, t) == False

def test_case_3():
    sol = Solution1()
    s = "anmnagramgr"
    t = "nagmargrnam"
    assert sol.isAnagram(s, t) == True

def test_case_4():
    sol = Solution1()
    s = "hello"
    t = "ohhello"
    assert sol.isAnagram(s, t) == False

def test_case_5():
    sol = Solution1()
    s = ""
    t = ""
    assert sol.isAnagram(s, t) == True

def test_case_6():
    sol = Solution1()
    s = "iceman!"
    t = "!cinema"
    assert sol.isAnagram(s, t) == True

def test_case_7():
    sol = Solution1()
    s = "hello"
    t = "world!"
    assert sol.isAnagram(s, t) == False

if __name__ == "__main__":
    test_case_1()
    test_case_2()
    test_case_3()
    test_case_4()
    test_case_5()
    test_case_6()
    test_case_7()

    print("All test cases passed!")