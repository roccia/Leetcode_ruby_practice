# Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.  Return a list of all possible strings we could create.
#
#     Examples:
#     Input: S = "a1b2"
# Output: ["a1b2", "a1B2", "A1b2", "A1B2"]
#
# Input: S = "3z4"
# Output: ["3z4", "3Z4"]
#
# Input: S = "12345"
# Output: ["12345"]
class LetterCasePermutation
  def letter_case_permutation(s)
    return [""] if s.empty?
    nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    temp = []
    back_track(s, 0, "", nums, temp)
    temp
  end

  def back_track(s, i, cur, nums, temp)
    if i == s.size
      temp << cur

    else
      c = s[i]
      if nums.include?(c)
        back_track(s, i+1, cur + c, nums, temp)
      else
        back_track(s, i+1, cur + c.upcase, nums, temp)
        back_track(s, i+1, cur + c.downcase, nums, temp)
      end
    end
  end


end

l = LetterCasePermutation.new

p l.letter_case_permutation('c')