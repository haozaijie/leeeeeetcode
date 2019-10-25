class Solution:
    def reverse(self, x: int) -> int:
        if x==0:
            return 0
        elif x>0:
            x=list(str(x))
            x.reverse()
            output=int(''.join(x))
            if output >(pow(2,31)-1):
                return 0
            else:
                return output
        else:
            x=list(str(-x))
            x.reverse()
            output=-int(''.join(x))
            if output <(-pow(2,31)):
                return 0
            else:
                return output
