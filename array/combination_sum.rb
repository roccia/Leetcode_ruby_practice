# Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
#
#     The same repeated number may be chosen from C unlimited number of times.
#
#         Note:
#     All numbers (including target) will be positive integers.
#     The solution set must not contain duplicate combinations.
#     For example, given candidate set [2, 3, 6, 7] and target 7,
#                                                              A solution set is:
#                                                                                 [
#                                                                                     [7],
#                                                                                     [2, 2, 3]
#                                                                                 ]
class CombinationSum
  def combination_sum(candidates, target)
    res = []
    temp = []
    new_candi = candidates.sort
    backtrack(new_candi, target, 0, temp, res)
    res
  end

  def backtrack(candi, target, index, temp, res)
    if target < 0
      return
    elsif target == 0
      res << temp
    else
      (index...candi.size).each do |i|
        #temp << candi[i]
        if candi[i] > target
          break
        end
        backtrack(candi, target - candi[i], i, temp+[candi[i]], res)
      end
    end

  end
end

c = CombinationSum.new
p c.combination_sum([2, 3, 6, 7], 7)