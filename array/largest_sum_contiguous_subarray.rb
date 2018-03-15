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
    current_max = ary[0]
    (1.. ary.size-1).each  do |i|
      current_max = 0 if current_max < 0
      current_max += ary[i]
      max_so_far = current_max if max_so_far < current_max
    end
    max_so_far
  end

end

 l = LargestSumContiguousSubarray.new
 ary = [1, -2, 3, 10, -4, 7, 2, -5]

p l.max_sub_array_sum(ary)