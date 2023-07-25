from typing import List

class Solution:
    def twoSum(self, listOfIntegers: List[int], target: int) -> List[int]:
        """
        Given a list of integers `listOfIntegers` and an integer `target`, 
        finds two numbers in the list that add up to the `target`.

        Args:
            listOfIntegers (List[int]): A list of integers.
            target (int): The target sum.

        Returns:
            List[int]: A list containing the indices of the two numbers in `listOfIntegers`
                       that add up to the `target`. If no such pair exists, returns
                       an empty list.
        """
        # Create an empty dictionary to store previously seen numbers and their indices
        prevMap = {}

        # Iterate through the list of numbers along with their indices
        for i, n in enumerate(listOfIntegers):
            # Calculate the difference between the target and the current number
            diff = target - n

            # Check if the difference is present in the dictionary
            if diff in prevMap:
                # If the difference is present, it means we have found a pair that adds up to the target.
                # Return the indices of the two numbers.
                return [prevMap[diff], i]

            # If the difference is not present, store the current number and its index in the dictionary.
            prevMap[n] = i

        # If no such pair is found during the iteration, return an empty list.
        return []

def test_two_sum_1():
    """
    Test for the `twoSum` method with a small list and a target that has a solution.
    """
    sol = Solution4()
    listOfIntegers = [2, 7, 11, 15]
    target = 9
    assert sol.twoSum(listOfIntegers, target) == [0, 1]

def test_two_sum_2():
    """
    Test for the `twoSum` method with a small list and a target that has a solution.
    """
    sol = Solution4()
    listOfIntegers = [3, 2, 4]
    target = 6
    assert sol.twoSum(listOfIntegers, target) == [1, 2]

def test_two_sum_3():
    """
    Test for the `twoSum` method with a small list and a target that has a solution.
    """
    sol = Solution4()
    listOfIntegers = [3, 3]
    target = 6
    assert sol.twoSum(listOfIntegers, target) == [0, 1]

def test_two_sum_4():
    """
    Test for the `twoSum` method with a larger list and a target that has a solution.
    """
    sol = Solution4()
    listOfIntegers = [1, 2, 3, 4, 5]
    target = 9
    assert sol.twoSum(listOfIntegers, target) == [3, 4]

if __name__ == "__main__":
    test_two_sum_1()
    test_two_sum_2()
    test_two_sum_3()
    test_two_sum_4()

    print("All test cases passed!")
