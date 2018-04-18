# Given an array of integers nums sorted in ascending order,
# find the starting and ending position of a given target value.
#
#     Your algorithm's runtime complexity must be in the order of O(log n).
#
# If the target is not found in the array, return [-1, -1].
#
# Example 1:
#
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
# Example 2:
#
# Input: nums = [5,7,7,8,8,10], target = 6
# Output: [-1,-1]

class SearchRange
  def extreme_insertion_index(nums, target, left)
    first = 0
    last = nums.size

    while first < last
      i = (first+last)/2
      if nums[i] > target || (left && nums[i] == target)
        last = i
      else
        first = i+1
      end
    end
    first
  end

  def search_range(nums, target)
    left_idx = extreme_insertion_index(nums, target, true)
    return [-1, -1] if left_idx == nums.size || nums[left_idx] != target
    [left_idx, extreme_insertion_index(nums, target, false)-1]
  end

end


s = SearchRange.new
p s.search_range([5, 7, 7, 8, 8, 10], 8)