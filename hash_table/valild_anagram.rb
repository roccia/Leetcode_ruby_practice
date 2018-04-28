# Given two strings s and t, write a function to determine if t is an anagram of s.
#
#     For example,
#         s = "anagram", t = "nagaram", return true.
#     s = "rat", t = "car", return false.

class ValildAnagram
  def is_anagram(s, t)
    hash = Hash.new(0)
    hash1 = Hash.new(0)
    s.chars.each {|n| hash[n] += 1}
    t.chars.each {|n| hash1[n] += 1}

    hash1.sort_by {|k, v| k} == hash.sort_by {|k, v| k}

  end
end

v = ValildAnagram.new
v.is_anagram('cbaebabacd', 'abc')