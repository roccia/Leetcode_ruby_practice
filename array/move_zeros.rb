# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#
# For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
#
# Note:
# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.
class MoveZeros
  def move_zeros(nums)
     zero = 0
     0.upto(nums.size-1) do |i|
        if nums[i] != 0
           nums[i],nums[zero] = nums[zero],nums[i]
          zero += 1
        end
     end
    nums
  end
end

m = MoveZeros.new

p m.move_zeros([0, 1, 0, 3, 12])