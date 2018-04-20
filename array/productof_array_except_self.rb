# Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
#     Solve it without division and in O(n).
#
#     For example, given [1,2,3,4], return [24,12,8,6].
#

class ProductofArrayExceptSelf

  def product_except_self(nums)
    len = nums.length
    res = Array.new(len)
    res[0] = 1
    (1...len).each{|i| res[i] = res[i-1]*nums[i-1]}  # [1, a1, a1*a2, a1*a2*a3]
    right = 1
    (len-1).downto(0).each{|i| res[i] *= right; right *= nums[i]} #[a2*a3*a4, a3*a4, a4, 1]
    res


    #  temp1[0] = 1
    #  (1...nums.length).each do |i|
    #      temp1[i] = temp1[i-1] * nums[i-1]
    #  end
    #  temp2[nums.length - 1]=1
    # (nums.length - 2).downto(0).each do |i|
    #    temp2[i] = temp2[i+1] * nums[i+1]
    # end
    # (0...nums.length).each do |i|
    #    temp1[i] *= temp2[i]
    # end
    # temp1
  end

end