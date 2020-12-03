class Solution:
    def romanToInt(self, s: str) -> int:
        mapping={'I':1,
                'V':5,
                'X':10,
                'L':50,
                'C':100,
                'D':500,
                'M':1000}
        prev=0
        total=0
        for i in list(s):
            if mapping[i]<=prev:
                total +=prev
                prev=mapping[i]
            else:
                total -= prev
                prev=mapping[i]
        total +=prev
        return total
