# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
    hm = {}

    while(head)
        return true if hm.key? head

        hm[head] = true
        head = head.next
    end

    false
end

print hasCycle([3,2,0,-4])