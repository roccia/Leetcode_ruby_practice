# Given a string, find the length of the longest substring without repeating characters.
#
#     Examples:
#
#     Given "abcabcbb", the answer is "abc", which the length is 3.
#
#         Given "bbbbb", the answer is "b", with the length of 1.
#
#             Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


class LongestSubstringWithoutRepeatingCharacters

  def length_of_longest_substring(s)
    return 0 if s.empty?
    max_length = 0
    start_idx = -1 # start index of current substring
    hash ={} # key-> value is char-> last occurance idx

    s.chars.each_with_index do |char, idx|
      last_idx = hash[char] # last occurance idx
      if last_idx && last_idx > start_idx
        start_idx = last_idx # reset start_idx, if char never occurs before start_idx will always be -1
      end

      len = idx - start_idx
      max_length = len if len > max_length # max_length_substring is s[start_idx...idx]

      # reset last occurance idx
      hash[char] = idx
    end

    max_length
  end

end

l = LongestSubstringWithoutRepeatingCharacters.new
p l.length_of_longest_substring('abbacedffg')
