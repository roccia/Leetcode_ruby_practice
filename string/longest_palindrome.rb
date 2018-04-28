#Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
# Input: "babad"
#
# Output: "bab"
#
# Note: "aba" is also a valid answer.

class LongestPalindrome

  def longest_palindrome(s)
    start = 0
    s_end = 0
    (0...s.size).each do |i|
      len1 = expand(s, i, i)
      len2 = expand(s, i, i+1)
      len = [len1, len2].max
      if len > s_end - start
        start = i - (len-1)/2
        s_end = i + len/2
      end
    end
    s[start..s_end]
  end

  def expand(s, left, right)
    while left >= 0 && right < s.size && s[left] == s[right]
      left -= 1
      right += 1
    end
    right - left - 1
  end

end

l = LongestPalindrome.new
p l.longest_palindrome('abb')

