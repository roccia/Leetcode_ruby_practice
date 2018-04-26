# Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
#
# Example 1:
# Given tree s:
#
#      3
#     / \
#    4   5
#   / \
#  1   2
# Given tree t:
#    4
#   / \
#  1   2
# Return true, because t has the same structure and node values with a subtree of s.
# Example 2:
# Given tree s:
#
#      3
#     / \
#    4   5
#   / \
#  1   2
#     /
#    0
# Given tree t:
#    4
#   / \
#  1   2
# Return false.


# Algorithm
#
# Instead of creating an inorder traversal, we can treat every node of the given tree tt as the root,
# treat it as a subtree and compare the corresponding subtree with the given subtree ss for equality.
# For checking the equality, we can compare the all the nodes of the two subtrees.
# For doing this, we make use a function traverse(s,t) which traverses over the given
# tree ss and treats every node as the root of the subtree currently being considered.
# It also checks the two subtrees currently being considered for their equality.
# In order to check the equality of the two subtrees, we make use of equals(x,y) function,
# which takes xx and yy, which are the roots of the two subtrees to be compared as the
# inputs and returns True or False depending on whether the two are equal or not.
# It compares all the nodes of the two subtrees for equality. Firstly, it checks whether
# the roots of the two trees for equality and then calls itself recursively for the left subtree and
# the right subtree.

# O(m*n)

class SubtreeOfAnothertree
  def is_subtree(s, t)
    traverse(s, t)
  end

  def traverse(s, t)
    s != nil && (equals(s, t) || traverse(s.left, t) || traverse(s.right, t))
  end

  def equals(x, y)
    return true if x.nil? && y.nil?
    return false if x.nil? || y.nil?
    x.val == y.val && equals(x.left, y.left) && equals(x.right, y.right)
  end
end