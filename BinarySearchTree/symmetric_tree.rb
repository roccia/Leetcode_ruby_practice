# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
#
#     For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
#
#       1
#      / \
#     2   2
#    / \ / \
#   3  4 4  3
# But the following [1,2,2,null,3,null,3] is not:
#      1
#     / \
#    2   2
#     \   \
#     3    3


# Two trees are a mirror reflection of each other if:
#
# Their two roots have the same value.
# The right subtree of each tree is a mirror reflection of the left subtree of the other tree.

class SymmetricTree
  def is_symmetric(root)
       is_mirror(root,root )
  end

  def is_mirror(t1,t2)
      return true if t1.nil? && t2.nil?
      return false if t1.nil? || t2.nil?
      t1.val == t2.val && is_mirror(t1.right,t2.left) && is_mirror(t1.left,t2.right)
  end
end