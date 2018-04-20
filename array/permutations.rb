# Given a collection of distinct integers, return all possible permutations.
#
#     Example:
#
#     Input: [1,2,3]
# Output:
#     [
#         [1,2,3],
#         [1,3,2],
#         [2,1,3],
#         [2,3,1],
#         [3,1,2],
#         [3,2,1]
#     ]

class Permutations
  def permute(nums)
    res = []
    back_track(nums,  [], res)
    res
  end

  def back_track(nums, temp, res)
    if temp.size == nums.size
      res << temp.clone
    else
      (0...nums.size).each do |i|
        next if temp.include?(nums[i])
        temp << nums[i]
        back_track(nums,  temp, res)
        temp.pop
      end
    end

  end

end
p = Permutations.new
p p.permute([1,1,2])