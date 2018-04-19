class Insertion
  def intersect( nums1, nums2)
       hash = {}
       res = []
       nums1.each do |i|
         hash[i] = hash.fetch(i,0) + 1

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