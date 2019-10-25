class Solution:
    def firstMissingPositive(self, nums: List[int]) -> int:
        small = 1
        for i in nums:
            if i == small:
                small += 1
            if small in nums:
                small += 1
        return small
