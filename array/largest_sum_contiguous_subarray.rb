# Initialize:
#     max_so_far = 0
# max_ending_here = 0
#
# Loop for each element of the array
#        (a) max_ending_here = max_ending_here + a[i]
#        (b) if(max_ending_here < 0)
#        max_ending_here = 0
#        (c) if(max_so_far < max_ending_here)
#        max_so_far = max_ending_here
#        return max_so_far


class LargestSumContiguousSubarray
  def max_sub_array_sum(ary)
    max_so_far =  ary[0]
    index_start = 0
    index_end = 0
    s = 0
    current_max = ary[0]
    1.upto(ary.size - 1)  do |i|
      current_max += ary[i]
      if max_so_far < current_max
        max_so_far = current_max
        index_start = s
        index_end = i
      end
      if current_max < 0
      current_max = 0
      s = i+1
      end
    end
    p "sum is : #{max_so_far}"
    p  "range : #{index_start}~  #{index_end}"
  end


  def max_sub_array_sum_dp(ary)
    max_so_far =  ary[0]
    max_ending_here = ary[0]
    (ary.size-1).downto(1) do |i|
      max_ending_here = max(ary[i], max_ending_here + ary[i])
      max_so_far = max(max_so_far,max_ending_here)
    end
    max_so_far
  end

  def max(*values)
      values.max
  end
end

 l = LargestSumContiguousSubarray.new
 ary = [1, -2, 3, 10, -4, 7, 2, -5]

p l.max_sub_array_sum(ary)
p l.max_sub_array_sum_dp(ary)