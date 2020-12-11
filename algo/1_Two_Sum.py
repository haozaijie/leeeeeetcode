# method 1 - brute force, the complexity is O(n^2)
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)-1):
            for j in range(i+1, len(nums)):
                if nums[i]+nums[j]==target:
                    return [i,j]


# method 2 - create a value to index dictionary, return the result if the desired value is already there, otherwise add the value to index pair to the dict; the time complexity is O(n)
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        table = {}
        for i, num in enumerate(nums):
            if target - num in table:
                return [table[target-num], i]
            table[num] = i 
