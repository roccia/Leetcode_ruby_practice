# Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
#
#     For example,
#         Given [100, 4, 200, 1, 3, 2],
#               The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4
# O(nlogn)

class LongestConsecutiveSequence

  def longest_consecutive(nums)
    return 0 if nums.size < 1
    new_nums = nums.sort
    longest_streak = 1
    current_streak = 1
    (1..new_nums.size).each do |i|
      if new_nums[i] != new_nums[i-1]
        if new_nums[i] == new_nums[i-1] + 1
          current_streak += 1
        else
          longest_streak = max(longest_streak,current_streak)
          current_streak = 1
        end
      end
    end
    max(longest_streak,current_streak)

  end

  def max(*value)
    value.max
  end


end

l = LongestConsecutiveSequence.new
nums = [100, 4, 200, 1, 3, 2]
p l.longest_consecutive(nums)