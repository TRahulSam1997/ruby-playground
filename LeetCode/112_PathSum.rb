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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
  return false if root.nil?

  ans = false
  sub_sum = target_sum - root.val
  if sub_sum.zero? && root.left.nil? && root.right.nil?
    ans = true
    return ans
  end

  ans ||= has_path_sum(root.left, sub_sum) unless root.left.nil?

  ans ||= has_path_sum(root.right, sub_sum) unless root.right.nil?

  ans
end
