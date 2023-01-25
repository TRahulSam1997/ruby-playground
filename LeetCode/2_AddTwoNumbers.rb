Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  dummy_head = ListNode.new(0)
  current = dummy_head
  carry = 0

  while l1 || l2
    x = l1 ? l1.val : 0
    y = l2 ? l2.val : 0
    sum = x + y + carry
    carry = sum / 10
    current.next = ListNode.new(sum % 10)
    current = current.next
    l1 = l1.next if l1
    l2 = l2.next if l2
  end

  current.next = ListNode.new(carry) if carry > 0
  dummy_head.next
end