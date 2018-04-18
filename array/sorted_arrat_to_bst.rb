class TreeNode
  attr_accessor :val,:left,:right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class SortedArrayToBST
  def sorted_array_to_bst(nums)
    return nil if nums.size == 0
    helper(nums,0,nums.size - 1 )

  end

  def helper(nums,left,right)
      return nil if left > right
      mid = (left + right )/2
      root = TreeNode.new(nums[mid])
      root.left = helper(nums,left,mid-1)
     root.right = helper(nums,mid+1,right)
     root
  end

end

s = SortedArratToBST.new
p s.sorted_array_to_bst([-10,-3,0,5,9])