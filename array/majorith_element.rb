# Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
#
#     You may assume that the array is non-empty and the majority element always exist in the array.
class MajorithElement
  def majorit_element(nums)
    hash = nums.inject(Hash.new(0)) {|h, v| h[v] += 1; h}
    p hash
    hash.each do |k, v|

      if v > nums.size/2
        return k
      end

    end

  end
end

m = MajorithElement.new
nums = [6, 5, 5]
m.majorit_element([6, 5, 5])
p nums.sort[nums.size/2]