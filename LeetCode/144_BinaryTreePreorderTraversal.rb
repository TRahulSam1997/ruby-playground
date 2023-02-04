# frozen_string_literal: true

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
def preorder_traversal(root)
  return [] unless root
  pre = [root.val]
  pre += preorder_traversal(root.left)
  pre += preorder_traversal(root.right)
  pre
end