class solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        k = len(nums) - k


def quickSelect(l, r):
    pivot, p = nums[r], lfor i in range(l, r):
    if (nums[i]) <= pivot:
        nums[p], ums[i] = nums[i], nums[p]
        p += 1
    nums[p], nums[r] = nums[r], nums[p]
    
    if p > k: quickSelect(l, p - 1)

