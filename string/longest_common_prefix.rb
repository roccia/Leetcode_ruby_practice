#Write a function to find the longest common prefix string amongst an array of strings.
# Time O(S*logn) S is sum of all characters in all strings
# The algorithm makes log(n) iterations,
# for each of them there are S = m*n comparisons, which gives in O(S*logn)

class LongestCommonPrefix
  def longest_common_prefix(strs)
    return '' if strs.empty? || strs.nil?
    min_len = (2**(0.size * 8 -2) -1)
    strs.each do |i|
      min_len = [min_len, i.size].min
    end

    low = 1
    high = min_len

    while low <= high
      middle = (low+high)/2
      if is_common_prefix(strs, middle)
        low = middle + 1
      else
        high = middle - 1
      end
    end
    strs[0][0, (low+high)/2]
  end

  def is_common_prefix(strs, len)
    s1 = strs[0][0, len]
    1.upto(strs.size-1) do |i|
      return false if !strs[i].start_with?(s1)
      true
    end

  end
end

l = LongestCommonPrefix.new
p l.longest_common_prefix(['a', 'b'])