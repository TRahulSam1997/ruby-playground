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
# @return {Integer}
def min_depth(root)
  return 0 if root.nil?
  return 1 if root.left.nil? && root.right.nil?
  left_child_depth = min_depth(root.left)
  right_child_depth = min_depth(root.right)
  if left_child_depth == 0 || right_child_depth == 0
    return left_child_depth + right_child_depth + 1
  else
    return [left_child_depth, right_child_depth].min + 1
  end
end