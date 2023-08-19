from collections import defaultdict

# neetcode
class Solution1:
    def groupAnagrams (self, strs: list[str]) -> list[list[str]]:
        res = defaultdict(list) # mapping charCount to List of Anagrams # Create a defaultdict with default values # stores lists of lists / groups of groups

        for s in strs:
            count = [0] * 26 # initialize a list to count occurrences of each character # a ... z

            for c in s:
                count[ord(c) - ord("a")] += 1 # increment the count for the character

            res[tuple(count)].append(s) # Convert the count list to a tuple and use it as a key in the defaultdict # Append the current string to the list associated with the key
        
        return list(res.values) # O (m * n * 26)

class Solution2:
    def groupAnagrams (self, strs: list[str]) -> list[list[str]]:
        anagramMap = defaultdict(list)
        result = [] # list

        for string in strs:
            sortedStrings = tuple(sortedStrings) # from list (mutable) to tuple (immutable)
            anagramMap[sortedStrings].append(string)
        
        for value in anagramMap.values():
            result.append(value)
        
        return result
    