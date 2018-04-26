# Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.
#
#     Example:
#
#     Input: The root of a Binary Search Tree like this:
#        5
#       /   \
#      2     13
#
# Output: The root of a Greater Tree like this:
#              18
#             /   \
#           20     13


#reverse in-order traversal,the basic idea of such a traversal is that before visiting any
# node in the tree, we must first visit all nodes with greater value
class GreaterTree

# For the recursive approach, we maintain some minor "global" state so each recursive call
# can access and modify the current total sum. Essentially, we ensure that the current
# node exists, recurse on the right subtree, visit the current node by updating its value
# and the total sum, and finally recurse on the left subtree. If we know that recursing on root.
# right properly updates the right subtree and that recursing on root.left properly updates the
# left subtree, then we are guaranteed to update
# all nodes with larger values before the current node and all nodes with smaller values after.
  def convert_bst(root)
    sum = 0
    if !root.nil?
      convert_bst(root.right)
      sum += root.val
      root.val = sum
      convert_bst(root.left)
    end
    root
  end

# One way to describe the iterative stack method is in terms of the intuitive recursive
#  solution. First, we initialize an empty stack and set the current node to the root.
# Then, so long as there are unvisited nodes in the stack or node does not point to null,
# we push all of the nodes along the path to the rightmost leaf onto the stack.
# This is equivalent to always processing the right subtree first in the recursive solution,
# and is crucial for the guarantee of visiting nodes in order of decreasing value.
# Next, we visit the node on the top of our stack, and consider its left subtree.
# This is just like visiting the current node before recursing on the left subtree in the recursive solution.
# Eventually, our stack is empty
# and node points to the left null child of the tree's minimum value node, so the loop terminates.
  def convert_bst_stack(root)
        sum = 0
        node = root
        stack = []
        while !stack.empty? || !node.nil?
          # push all nodes up to (and including) this subtree's maximum on
          # the stack.
          while !node.nil?
            stack << node
            node = node.right
          end
          node = stack.pop
          sum += node.val
          node.val = sum
          # all nodes with values between the current and its parent lie in
          # the left subtree.
          node = node.left
        end
       root
  end
end