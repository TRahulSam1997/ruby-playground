# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  len1 = get_length(headA)
  len2 = get_length(headB)

  if len1 > len2
    headA = move_head_by_distance(headA, len1 - len2)
  elsif len2 > len1
    headB = move_head_by_distance(headB, len2 - len1)
  end

  while !headA.nil? && !headB.nil?
    return headA if headA == headB

    headA = headA.next
    headB = headB.next
  end

  nil
end

def get_length(head)
  length = 0
  current = head
  until current.nil?
    length += 1
    current = current.next
  end
  length
end

def move_head_by_distance(head, distance)
  current = head
  distance.times do
    current = current.next
  end
  current
end

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  return [] if root.nil?
  left_t = postorder_traversal(root.left)
  right_t = postorder_traversal(root.right)
  left_t + right_t + [root.val]
end

# @param {String} column_title
# @return {Integer}
def title_to_number(column_title)
  result = 0
  n = column_title.length

  column_title.each_char.with_index do |char, i|
    column_number = char.ord - 'A'.ord + 1
    result += column_number * 26**(n - i - 1)
  end

  result
end

puts title_to_number('AB')
