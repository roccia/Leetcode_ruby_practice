# Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.
# Example 1:
# Input:s1 = "ab" s2 = "eidbaooo"
# Output:True
# Explanation: s2 contains one permutation of s1 ("ba").
# Example 2:
# Input:s1= "ab" s2 = "eidboaoo"
# Output: False
class PermutationInString
  def check_inclusion(s1, s2)
    return false if s1.nil? || s1.empty? || s2.nil? || s2.empty?
    hash = Hash.new(0)
    s1.chars.each {|n| hash[n] += 1}
    left = 0
    right = 0
    count = hash.size
    while right < s2.size
      c = s2[right]
      if hash.has_key?(c)
        hash[c] -= 1
        count -= 1 if hash[c] == 0
      end
      right += 1
      while count == 0
        tempc = s2[left]
        if hash.has_key?(tempc)
          hash[tempc] += 1
          count += 1 if hash[tempc] > 0
        end
        if right - left == s1.size
          return true
        end
        left += 1
      end
    end
    false
  end
end