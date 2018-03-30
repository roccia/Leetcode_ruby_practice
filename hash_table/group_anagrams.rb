# Given an array of strings, group anagrams together.
#
#     For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
#         Return:
#
#             [
#                 ["ate", "eat","tea"],
#                 ["nat","tan"],
#                 ["bat"]
#             ]

class GroupAnagrams
  # keys are sorted words and the value is the list of words that sorts to the given key
  # {["a", "e", "t"]=>["eat", "tea", "ate"],
  # ["a", "n", "t"]=>["tan", "nat"], ["a", "b", "t"]=>["bat"]}

  # Time Complexity: O(NKlog(K)),
  # where N is the length of strs, and K is the maximum length of a string in strs.
  # The outer loop has complexity O(N) as we iterate through each string.
  # Then, we sort each string in O(KlogK) time.
  #
  # Space Complexity: O(N*K), the total information content stored in ans

  def group_anagrams(strs)
    hash = strs.each_with_object(Hash.new []) do |word, hash|
      p hash
      p word
      hash[word.chars.sort] += [word]
    end
    hash.values
  end


end

strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
g = GroupAnagrams.new
p g.group_anagrams(strs)