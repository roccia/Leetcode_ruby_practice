# Invert a binary tree.
#
#     4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9
# to
#
#     4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1
class InvertTree
  def invert_tree(root)
    return nil if root.nil?

    left = invert_tree root.right
    right = invert_tree root.left
    root.left = left
    root.right = right

    root
  end
end