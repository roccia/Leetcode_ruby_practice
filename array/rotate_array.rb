# Rotate an array of n elements to the right by k steps.
#
#     For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4].

# Original List                   : 1 2 3 4 5 6 7
# After reversing all numbers     : 7 6 5 4 3 2 1
# After reversing first k numbers : 5 6 7 4 3 2 1
# After revering last n-k numbers : 5 6 7 1 2 3 4 --> Result

class RotateArray
  def rotate(nums, k)
    k %= nums.length
    swap(nums,0,nums.length - 1 )
    swap(nums,0,k-1)
    swap(nums,k,nums.length - 1)
  end

  def swap(nums,left,right)
    while left < right
      temp = nums[left]
      nums[left] = nums[right]
      nums[right] = temp
      left += 1
      right -=1
    end
    nums
  end
end