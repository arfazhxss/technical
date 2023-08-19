"""
Given a list of integers `listOfIntegers` and an integer `target`, 
finds two numbers in the list that add up to the `target`.

Args:
    listOfIntegers (list[int]): A list of integers.
    target (int): The target sum.

Returns:
    list[int]: A list containing the indices of the two numbers in `listOfIntegers`
                that add up to the `target`. If no such pair exists, returns
                an empty list.
"""

class Solution:
    def twoSum(self, listOfIntegers: list[int], target: int) -> list[int]:
        # 
        # Hashmap to store previously seen numbers and their indices
        prevMap = {}

        # 
        # Iterate through the listOfIntegers's values and it's indexes
        ### for index, value in enumerate(list/array/tuple/string) ###
        #
        for i, n in enumerate(listOfIntegers):
            # 
            # n --> current value &&& i --> current index
            diff = target - n
            # diff --> difference between the target number and n

            # 
            # Check if the difference is present in the hashmap
            if diff in prevMap:
                # If the difference is present, it means we have found a pair that adds up to the target.
                # Return the indices of the two numbers.
                return [prevMap[diff], i]

            # If the difference is not present, store the current number and its index in the hashmap.
            # KEY VALUE PAIR: KEY (element) VALUE (element_index)
            prevMap[n] = i
            # I can safely assume the first element will always be hashed
            # in the hashmap

        # If no such pair is found during the iteration, return an empty list.
        return []
    

#################################################################
##### Everything after this section is for testing purposes #####
#################################################################

def test_two_sum_1():
    """
    Test for the `twoSum` method with a small list and a target that has a solution.
    """
    sol = Solution()
    listOfIntegers = [2, 7, 11, 15]
    target = 9
    assert sol.twoSum(listOfIntegers, target) == [0, 1]

def test_two_sum_2():
    """
    Test for the `twoSum` method with a small list and a target that has a solution.
    """
    sol = Solution()
    listOfIntegers = [3, 2, 4]
    target = 6
    assert sol.twoSum(listOfIntegers, target) == [1, 2]

def test_two_sum_3():
    """
    Test for the `twoSum` method with a small list and a target that has a solution.
    """
    sol = Solution()
    listOfIntegers = [3, 3]
    target = 6
    assert sol.twoSum(listOfIntegers, target) == [0, 1]

def test_two_sum_4():
    """
    Test for the `twoSum` method with a larger list and a target that has a solution.
    """
    sol = Solution()
    listOfIntegers = [1, 2, 3, 4, 5]
    target = 9
    assert sol.twoSum(listOfIntegers, target) == [3, 4]

if __name__ == "__main__":
    test_two_sum_1()
    test_two_sum_2()
    test_two_sum_3()
    test_two_sum_4()

    print("All test cases passed!")

################################################################
######################## END OF TESTING ########################
################################################################