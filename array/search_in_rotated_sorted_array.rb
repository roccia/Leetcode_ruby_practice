# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
# You are given a target value to search. If found in the array return its index, otherwise return -1.
# You may assume no duplicate exists in the array.

class Search_in_Rotated_Sorted_Array
  def search_rotated(nums, target)
    left = 0
    right = nums.size-1
    while (left<=right)
      mid = (left+right)/2
      return mid if target == nums[mid]
      if nums[left] <= nums[mid]
        if target >= nums[left] && target < nums[mid]
          right = mid - 1
        else
          left = mid + 1
        end
      else
        if target > nums[mid] && target <= nums[right]
          left = mid + 1
        else
          right = mid - 1
        end
      end
    end
    nums[left] == target ? left : -1
  end
end