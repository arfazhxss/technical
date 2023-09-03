class Solution:
    def isValid (self, s: str) -> bool:
        stack = [] 
        closeToOpen = { ")" : "(", "]": "[", "}": "{" }

        for c in s: # for each character in the string
            if c in closeToOpen: # if the character is either ) or } or ]
                if stack and stack[-1] == closeToOpen[c]: # checking if the closing bracket we found closes the last opening bracket 
                    stack.pop() # we're popping the last opening brackets on stack if the condition works
                else:
                    return False # ")....." closing brackets in the beginning
            else:
                stack.append(c) # only appending ( and { and [
        return True if not stack else False
    
    # 
    # 3-4
    # We are creating a list and a hashmap
    # 
    # 6-13
    # for each letter in the string we are checking if the character is a '('...value...opening bracket or a ')'...key...closing bracket
    # if it's a closing bracket that matches the last opening bracket, then we are popping the last opening bracket
    #
    # 14 
    # we are only appending OPENING BRACKETS aka ( or { or [