# Given a non-empty array of integers, return the k most frequent elements.
#
#     For example,
#         Given [1,1,1,2,2,3] and k = 2, return [1,2].


class TopKFrequentElements
  def top_k_frequent(nums, k)
    hash = nums.inject(Hash.new(0)) {|h, v| h[v] += 1; h}
    p hash.sort_by(&:last).first(k).map(&:first)

  end
end


t = TopKFrequentElements.new
nums = [1,1,1,2,2,3]
t.top_k_frequent(nums, 2)