class LargestNumberAtLeastTwiceofOthers
  def dominant_index(nums)
    largest = 0
    second_largest = 0
    index = -1
    nums.each_with_index do |_, i|
      if nums[i] > largest
        second_largest = largest
        largest = nums[i]
        index = i
      elsif nums[i] > second_largest
        second_largest = nums[i]
      end
    end
     second_largest * 2 > largest ? -1 : index
  end
end

l = LargestNumberAtLeastTwiceofOthers.new
p l.dominant_index( [3, 6, 1, 0])