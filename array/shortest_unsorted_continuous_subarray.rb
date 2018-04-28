# Given an integer array, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.
#
#     You need to find the shortest such subarray and output its length.
class ShortestUnsortedContinuousSubarray
  def find_unsorted_subarray(nums)
       sorted = nums.sort
       start = sorted.size
       s_end = 0
       sorted.each_with_index do |_,i|
           if sorted[i] != nums[i]
               start = [start,i].min
               s_end = [s_end,i].max
           end
       end
       s_end - start >= 0 ? s_end - start + 1 : 0
  end
end

s = ShortestUnsortedContinuousSubarray.new
p s.find_unsorted_subarray([2, 6, 4, 8, 10, 9, 15])