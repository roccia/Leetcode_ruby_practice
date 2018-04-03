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