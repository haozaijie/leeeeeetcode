class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        count = 0
        temp = l1
        num3 = temp.val
        while temp.next:
            count += 1
            temp = temp.next
            num3 += temp.val * (pow(10,count))
        count2 = 0
        temp2 = l2
        num3 += temp2.val 
        while temp2.next:
            count2 += 1
            temp2 = temp2.next
            num3 += temp2.val * (pow(10,count2))
        num4= list(str(num3))
        node1 = ListNode(num4[0])
        for i in num4[1:]:
            node2=ListNode(i)
            node2.next = node1
            node1 = node2
        return node1
