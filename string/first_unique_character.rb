# Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
#
#     Examples:
#
#     s = "leetcode"
# return 0.
#
#     s = "loveleetcode",
#     return 2.

class FirstUniqueCharacter
  def first_uniq_char(s)
    ary = s.chars
    hash = ary.inject(Hash.new(0)) {|h, v| h[v] += 1; h}
    p hash.has_value?(1)
    return -1 if !hash.has_value?(1)
    hash.each do |k, v|
      if v == 1
       return ary.find_index(k)
      end
    end

  end
end

f = FirstUniqueCharacter.new
p f.first_uniq_char('lleettccoodde')