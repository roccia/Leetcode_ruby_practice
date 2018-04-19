class HouseRobber
  def rob(nums)
    return 0 if nums.empty?
    return nums.first if nums.size == 1
    res = Array.new(nums.size)
    res[0] = nums[0]
    res[1] = [nums[0], nums[1]].max
    mark = '#'
    (2...nums.size).each do |i|
      res[i] = [(res[i-2]+nums[i]),res[i-1]].max

    end
    res[nums.length - 1 ]
  end

  def rob2(nums)
    return 0 if nums.empty?
    return nums.first if nums.size == 1
    res = Array.new(nums.size)
    res[0] = nums[0]
    res[1] = [nums[0], nums[1]].max
    mark = '#'
    (2...nums.size).each do |i|
      res[i] = [(res[i-2]+nums[i]),res[i-1]].max
    end
    res[nums.length - 1 ]
  end
end

 h = HouseRobber.new
 p h.rob([1,2,3,4,5])