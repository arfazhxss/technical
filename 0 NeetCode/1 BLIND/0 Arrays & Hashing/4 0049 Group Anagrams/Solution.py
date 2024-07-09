from collections import defaultdict

# neetcode
class Solution1:
    def groupAnagrams (self, strs: list[str]) -> list[list[str]]:
        res = defaultdict(list) # mapping charCount to List of Anagrams # Create a defaultdict with default values # stores lists of lists / groups of groups

        for s in strs:
            count = [0] * 26 
            # initialize a list to count occurrences of each character # a ... z

            for c in s:
                count[ord(c) - ord("a")] += 1 
                # increment the count for the character

            res[tuple(count)].append(s) 
            # Convert the count list to a tuple and use it as a key in the defaultdict 
            # Append the current string to the list associated with the key
        
        return list(res.values) # O (m * n * 26)

# myfav solution
class Solution2: # ["cat", "dog", "tac", "god", "act"]
    def groupAnagrams (self, strs: list[str]) -> list[list[str]]:
        anagramMap = defaultdict(list)
        result = []
        # list

        for string in strs:
            sortedStrings = tuple(sorted(string)) 
            anagramMap[sortedStrings].append(string) 
            # string "cat" to sorted tuple ('a','c','t')
            # for "cat", it will just create a key:value entry
            # The key would be the current sortedString ('a','c','t') which would now only have ["cat"]
            # When "tac" and "act" would come, the sortedString would also look like ('a','c','t')
            # so the .append(string) would append these two strings as -->
            #                  { ('a', 'c', 't'): ['cat', 'tac', 'act'] }
        
        for value in anagramMap.values(): # key:value pair
            result.append(value) 
            # VALUEs --> ['cat', 'tac', 'act'] and ['dog', 'god']
            # After Append --> [ ['cat', 'tac', 'act'], ['dog', 'god'] ]
            # A 2D List/Array
        
        return result
    