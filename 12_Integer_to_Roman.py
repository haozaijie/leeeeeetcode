class Solution:
    def intToRoman(self, num: int) -> str:
        mapping = {1:'I',
                  4:'IV',
                  5:'V',
                  9:'IX',
                  10:'X',
                  40:'XL',
                  50:'L',
                  90:'XC',
                  100:'C',
                  400:'CD',
                  500:'D',
                  900:'CM',
                  1000:'M'}
        values=list(mapping.keys())
        values.reverse()
        output = ''
        for i in values:
            if num//i >0:
                output += (num//i)*mapping[i]
                num = num%i
        return output
