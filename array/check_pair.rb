#Subarray Sum Equals K
#Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
class CheckPair

  def check_pair(ary, target)
    return 0 if ary.size <= 1
    hash = Hash.new
    (ary.size-1).downto(0) do |i|
      temp = target - ary[i]
      if temp > 0 && hash[temp] == 1
        p "#{ary[i]} and #{temp} "
      end
      hash[ary[i]] = 1
    end
  end

  def check_pair_dp(ary, target)
    return 0 if ary.size < 1
    sum = 0
    count = 0
    temp = sum - target
    hash = {}
    hash[0] = 1
    (ary.size - 1).downto(0) do |i|
      sum += ary[i]
      if hash.has_key?(temp)
        count += hash[temp]
      end
      hash[sum] = hash.fetch(sum, 0) + 1
    end
    count
  end
end


c = CheckPair.new
p ary = [1, 2, 3, 4, 5, 6]
p c.check_pair(ary, 6)