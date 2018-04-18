# Given an array of n positive integers and a positive integer s,
# find the minimal length of a contiguous subarray of which the sum ≥ s.
# If there isn't one, return 0 instead.
#
# For example, given the array [2,3,1,2,4,3] and s = 7,
# the subarray [4,3] has the minimal length under the problem constraint.
class MinimumSizeSubarraySum
  def min_sub_array_len(s, nums)
    return 0 if nums.nil? || nums.empty?
    first = 0
    last = 0
    sum = 0
    result = nums.length+1

    while last < nums.length
      while sum < s && last < nums.length
        sum += nums[last]
        last += 1
      end

      while sum >= s && first < last
        result = [last - first, result].min
        sum -= nums[first]
        first += 1
      end
    end

    result == nums.length+1 ? 0 : result

  end

  def min_sub_array_len_2(s, nums)
    start, minlen = 0, nums.size + 1
    sum = 0
    (0...nums.size).each do |i|
      sum += nums[i]
      while sum >= s
        minlen = [minlen, i - start + 1].min
        sum -= nums[start]
        start+=1
      end
    end

    minlen == nums.size+1 ? 0 : minlen
  end

end


m = MinimumSizeSubarraySum.new
p m.min_sub_array_len(7, [2, 3, 1, 2, 4, 3])