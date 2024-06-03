class Solution1:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        
        # countS -> occurance of each character in string S
        # countT -> occurance of each character in string T
        # We want to know if S is an anagram for T
        # 
        # We setting the Hashmaps for both these strings S and T
        countS, countT = {}, {} # HASHMAP S and T

        for i in range(len(s)):
            countS[s[i]] = 1 + countS.get(s[i], 0) 
            countT[t[i]] = 1 + countT.get(t[i], 0) 
        # key is s/t[i], we are setting the values using the get() method. 
        # 0 is used for cases --->
        # ----------> when a key exist in 'S' but doesn't exist in T

        # now since we already have Hashmaps countS and countT
        # we can iterate through each keys in countS and check 
        # whether that key has the same value as with the countT
        #
        # since if they are anagrams, they have to have / must have
        # the same number of values for each keys in both of their 
        # Hashmaps
        for c in countS: 
            if countS[c] != countT.get(c, 0): 
                return False
        return True

#################################################################
##### Everything after this section is for testing purposes #####
#################################################################

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

################################################################
######################## END OF TESTING ########################
################################################################