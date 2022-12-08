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
def max_depth(root)
  return 0 if root == nil

  if root.left == nil && root.right == nil
    1
  else
    l_node = max_depth(root.left)
    r_node = max_depth(root.right)
    (1 + ((l_node > r_node) ? l_node : r_node))
    end
end