# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

# Given nums = [2, 7, 11, 15], target = 9,
#
#       Because nums[0] + nums[1] = 2 + 7 = 9,
#     return [0, 1].

class TwoSum21061221

  def self.two_sum(nums, target)

       hash = {}
      nums.each_with_index { |value,index |
         if  diff = hash[target - value]   # return diff's index
           return [diff,index]
         else
             hash[value] = index
         end
      }
  end

end

TwoSum21061221.two_sum([2,7,5,3], 8)