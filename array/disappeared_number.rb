# Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
#
#     Find all the elements of [1, n] inclusive that do not appear in this array.
#
#     Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
#
#     Example:
#
#     Input:
#     [4,3,2,7,8,2,3,1]
#
# Output:
#     [5,6]

class DisappearedNumber
  def find_disappeared_numbers(nums)
       res = []
       nums.each_with_index do |_,i|
           val = nums[i].abs - 1
           if nums[val] > 0
              nums[val] = -nums[val]
           end
       end

       nums.each_with_index do |_,i|
          if nums[i] > 0
             res << i + 1
          end
       end
    res
  end
end

 d = DisappearedNumber.new
p d.find_disappeared_numbers([4,3,2,7,8,2,3,1])