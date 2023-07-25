from typing import List

class Solution4:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        prevMap = {}  # val: index

        for i, n in enumerate(nums):
            diff = target - n
            if diff in prevMap:
                return [prevMap[diff], i]
            prevMap[n] = i
        return

def test_two_sum_1():
    sol = Solution4()
    nums = [2, 7, 11, 15]
    target = 9
    assert sol.twoSum(nums, target) == [0, 1]

def test_two_sum_2():
    sol = Solution4()
    nums = [3, 2, 4]
    target = 6
    assert sol.twoSum(nums, target) == [1, 2]

def test_two_sum_3():
    sol = Solution4()
    nums = [3, 3]
    target = 6
    assert sol.twoSum(nums, target) == [0, 1]

def test_two_sum_4():
    sol = Solution4()
    nums = [1, 2, 3, 4, 5]
    target = 9
    assert sol.twoSum(nums, target) == [3, 4]

if __name__ == "__main__":
    test_two_sum_1()
    test_two_sum_2()
    test_two_sum_3()
    test_two_sum_4()

    print("All test cases passed!")
