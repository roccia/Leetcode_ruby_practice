#Subarray Sum Equals K
#Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
class CheckPair

  def check_pair(ary,target)
       return 0 if ary.size <= 1
       hash = Hash.new
       res = []
       (0..ary.size-1).each do |i|
           temp = target - ary[i]
           if hash.has_key?(temp)
             p hash[temp]
             res << [temp,ary[i]]
           end
         hash[ary[i]] = 1
       end
    res
  end


  #Two Sum II - Input array is sorted
  def check_pair_index(nums,target)
    (nums.size-1).downto(0).each do |i|
         left = i+1
         right = nums.size - 1
         temp = target - nums[i]
        while left <= right
             mid = (left+right)/2
             if nums[mid] == temp
                 return [i+1,mid+1]
             elsif nums[mid] < temp
                 left = mid + 1
               p "left : #{left}"
             else
                right = mid - 1
               p right
             end
        end
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
p ary = [1,2,3,4,5]
p c.check_pair_index(ary, 6)