# Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
#
# Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
#
# The order of output does not matter.
#
# Example 1:
#
# Input:
# s: "cbaebabacd" p: "abc"
#
# Output:
# [0, 6]
#
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".
# Example 2:
#
# Input:
# s: "abab" p: "ab"
#
# Output:
# [0, 1, 2]
#
# Explanation:
# The substring with start index = 0 is "ab", which is an anagram of "ab".
# The substring with start index = 1 is "ba", which is an anagram of "ab".
# The substring with start index = 2 is "ab", which is an anagram of "ab".


# 首先，先构造一个map，对于p中的每个字符char，都有map[char]++。
# 然后，初始化一个长度为0的窗口，left = 0，right = 0。第一步先扩展窗口，
# 也就是在right的右边界上做文章。每次right读到一个字符char，都有map[char]–。
# 当map[char]的值大于等于1时，很明显就是窗口中进入了一个p中含有的字符。
# 我们可以取一个变量count，值为p中所有字符的总数。每次有一个p中字符进入窗口，则count–。这样，当count == 0的时候，表明我们的窗口中包含了p中的全部字符，得到一个结果。
# 当窗口包含一个结果以后，为了进一步遍历，我们需要缩小窗口使窗口不再包含全部的p，
# 同样，如果map[char]>=0，表明一个在p中的字符就要移除窗口，那么count ++，以此类推。
class FindAllAnagrams
  def find_anagrams(s, p)
    res = []
    return res if s.nil? || s.empty? || p.nil? || p.empty?
    hash = Hash.new(0)
    # create hashmap to save the character of target string
    # later on these get decremented when a character is found
    # a positive count means that character is still needed in the anagram
    # negitive count menas that either the character was found more times than necessary
    # or it is not needed at all
    p.chars.each {|n| hash[n] += 1}
    #two pointer of the window
    left = 0
    right = 0
    #maintain a counter to check whether match the target string
    count = hash.size

    # loop at the beging of the source string
    while right < s.size
      # process current character
      c = s[right]
      if hash.has_key?(c)
        hash[c] -= 1 # decrement it
        count -= 1 if hash[c] == 0
      end
      right += 1

      # increase left pointer to make it invalid/valid again
      while count == 0
        #choose a char at left pointer
        tempc = s[left]
        if hash.has_key?(tempc)
          hash[tempc] += 1
          count += 1 if hash[tempc] > 0
        end
        if right - left == p.size
          res << left
        end
        left += 1
      end
    end
    res
  end
end

f = FindAllAnagrams.new
p f.find_anagrams('cbaebabacd', 'abc')