class Solution:
    """
    @param: strs: a list of strings
    @return: encodes a list of strings to a single string.
    """
    def encode(self, strs):
        res = ""
        for s in strs:
            res += str(len(s)) + "#" + s 
        return res


    """
    @param: str: A string
    @return: decodes a single string to a list of strings
    """
    def decode(self, str):
        res, i = [], 0

        while i < len(str): 
            j = i 

            while str[j] != "#": 
                j += 1 

            length = int(str[i:j])
            res.append(str[j + 1 : j + 1 + length])
            i = j + 1 + length

        return res

"""
    def decode(self, str):
        res, i = [], 0                                  # "cat" --> "3#cat"

        while i < len(str):                             # just to clarify --> str is the BIG STRING like "3#cat4#do#g"
            j = i 
                                                        # and j here is just an updated i         << i == j == 0 >>
            while str[j] != "#":                        # that is until it reaches the '#' in '3#', j will iterate
                j += 1                                  # j will only read the numerals before '#'; in our example 3 and 4
                                                        # !! J WILL ALWAYS GRAB THE RIGHT PRE-#-NUMERAL !!
            length = int(str[i:j])                      # length of the next str
            res.append(str[j + 1 : j + 1 + length])     # next str
            i = j + 1 + length                          # updating i to the current j

        return res
"""
