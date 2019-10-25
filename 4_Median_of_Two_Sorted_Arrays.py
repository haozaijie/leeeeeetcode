class Solution:
    def findMedian(self, nums:List[int])->float:
        if len(nums)%2 ==1:
            return nums[len(nums)//2]
        else :
            return (nums[len(nums)//2-1]+nums[len(nums)//2])/2
        
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        num = nums1 + nums2
        num.sort()
        if len(num) ==1:
            return num[0]
        else:
            return self.findMedian(num)
