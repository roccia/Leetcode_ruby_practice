#Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.
#Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
# Given nums = [1,1,2],
#
#  Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
#  It doesn't matter what you leave beyond the new length.

class RemoveDuplicates
  # @param {Integer[]} nums
  # @return {Integer}
  def remove_duplicates(nums)
      return nums.size if nums.size<2
      tail = 0
      nums[1..-1].each_with_index do |value,index|

          if nums[index] != value
             tail += 1
             nums[tail] = value
          end
      end

      tail + 1
  end

end

 r = RemoveDuplicates.new
ary = [2,2,2,2,4,4]

p r.remove_duplicates(ary)