# Given a binary search tree and the lowest and highest boundaries as L and R, trim the tree so that all its elements lies in [L, R] (R >= L). You might need to change the root of the tree, so the result should return the new root of the trimmed binary search tree.
#
#     Example 1:
#     Input:
#     1
#    / \
#   0   2
#
#   L = 1
#   R = 2
#
# Output:
#     1
#       \
#        2
# Example 2:
# Input:
#     3
#    / \
#   0   4
#    \
#    2
#   /
#   1
#
#   L = 1
#   R = 3
#
# Output:
#       3
#      /
#     2
#    /
#   1

class TrimTree
  # When node.val > R, we know that the trimmed binary tree must occur to the left of the node.
  #  Similarly, when node.val < L, the trimmed binary tree occurs to the right of the node.
  #   Otherwise, we will trim both sides of the tree.
  def trim_bst(root, l, r)
    return root if root.nil?
    return trim_bst(root.left, l, r) if root.val > r
    return trim_bst(root.right, l, r) if root.val < l
    root.left = trim_bst(root.left, l, r)
    root.right = trim_bst(root.right, l, r)
    root
  end
end