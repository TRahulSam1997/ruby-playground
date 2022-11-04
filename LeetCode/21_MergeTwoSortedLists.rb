# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  if (!list1)
    return list2
  elsif (!list2)
    return list1
  end

  merged_head = nil
  if (list1.val <= list2.val)
    merged_head = list1
    list1 = list1.next
  else
    merged_head = list2
    list2 = list2.next
  end

  merged_tail = merged_head

  while (list1 && list2)
    temp = nil
    if (list1.val <= list2.val)
      temp = list1
      list1 = list1.next
    else
      temp = list2
      list2 = list2.next
    end

    merged_tail.next = temp
    merged_tail = temp
  end

  if(list1)
    merged_tail.next = list1
  elsif (list2)
    merged_tail.next = list2
  end

  return merged_head
end

print merge_two_lists([1,2,4], [1,3,4])