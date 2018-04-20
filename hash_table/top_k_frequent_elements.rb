# Given a non-empty array of integers, return the k most frequent elements.
#
#     For example,
#         Given [1,1,1,2,2,3] and k = 2, return [1,2].


class TopKFrequentElements
  def top_k_frequent(nums, k)
   hash = Hash.new(0)
   nums.each do |n|
     hash[n] += 1
   end
   p hash
   result = []
   sorted = hash.sort_by{|k,v| v}

   until result.length == k
     result << sorted.pop.first
   end
    # hash = nums.inject(Hash.new(0)) {|h, v| h[v] -= 1; h}
    #
    # p hash.sort_by(&:last).first(k).map(&:first)
    result

  end

  def most_common_word(paragraph, banned)
    ary = paragraph.downcase.gsub(/[-,.?:;'"!`]/,'').split(' ')
    hash = Hash.new(0)
    ary.each{|n| hash[n] += 1 }
    banned.each{|b| hash.delete(b) if hash.has_key?(b)}
    hash.sort_by{|_,v|v}.pop.first

  end

end


t = TopKFrequentElements.new
nums = [1,1,1,2,2,3]
 t.top_k_frequent(nums, 2)
s = "Bob hit a ball, the hit BALL flew far after it was hit."
b = ['hit']
p t.most_common_word(s,b)
