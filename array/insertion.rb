# Given two arrays, write a function to compute their intersection.
#
#     Example:
#     Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
#
#     Note:
#     Each element in the result should appear as many times as it shows in both arrays.
#     The result can be in any order.

class Insertion
  def intersect( nums1, nums2)
       hash = Hash.new { |h, k| h[k] = 0 }
       p hash.inspect
       res = []
       nums1.each do |i|
       hash[i] += 1
       end
       p hash
       nums2.each do |i|
          if (hash.has_key? i) && hash[i] > 0
             res << i
             hash[i] -= 1
          end
       end
     res
  end
end

i  = Insertion.new
p i.intersect([1, 2, 2, 1],[2,2])