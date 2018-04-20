class Permutations2
  def permute(nums)
    res = []
    used = Array.new(nums.length)
    back_track(nums.sort!, [], used, res)
    res
  end

  def back_track(nums, temp, used, res)
    if temp.size == nums.size
      res << temp.clone
    else
      (0...nums.size).each do |i|
        next if used[i] || (i>0 && nums[i-1] == nums[i] && !used[i-1]) # when a number has same value with its previous and previous is used, we can use this number
        temp << nums[i]
        used[i] = true
        back_track(nums, temp, used, res)
        temp.pop
        used[i] = false
      end
    end

  end

end

p = Permutations2.new
p p.permute([3, 3, 0, 3])