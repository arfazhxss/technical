from typing import List
import unittest

class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        a = {}
        for i in range(len(nums)):
            a[nums[i]]=1+a.get(nums[i],0)
        
        buckets = [[] for _ in range(len(nums) + 1)]
        [buckets[v].append(k) for k, v in a.items()]
        
        print("TEST1",buckets)
        result = []
        for i in range(len(buckets) - 1, 0, -1):
            result.extend(buckets[i])
            if len(result) >= k:
                return result[:k]
        return result

class TestSolution(unittest.TestCase):
    def setUp(self):
        self.solution = Solution()

    def test_topKFrequent(self):
        self.assertEqual(self.solution.topKFrequent([1, 1, 1, 2, 2, 3], 2), [1, 2])
        self.assertEqual(self.solution.topKFrequent([1], 1), [1])
        self.assertEqual(self.solution.topKFrequent([1, 2, 3, 4, 5, 5, 5, 4, 4, 3], 3), [4, 5, 3])
        self.assertEqual(self.solution.topKFrequent([4, 4, 4, 4, 4, 4], 1), [4])
        self.assertEqual(self.solution.topKFrequent([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 2), [4, 3])

if __name__ == "__main__":
    unittest.main()
