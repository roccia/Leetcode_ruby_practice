#Subarray Sum Equals K
#Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
class CheckPair

  def check_pair(ary,target)
       return 0 if ary.size <= 1
       hash = Hash.new
       (ary.size-1).downto(0) do |i|
           temp = target - ary[i]
           if temp > 0 && hash[temp] == 1
             p  "#{ary[i]} and #{temp} "
           end
         hash[ary[i]] = 1
       end
  end


end


 c = CheckPair.new
p ary = [1,2,3,4,5,6]
p c.check_pair(ary,6)