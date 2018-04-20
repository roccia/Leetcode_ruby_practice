# Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
#
#     Each number in candidates may only be used once in the combination.
#
#     Note:
#
#     All numbers (including target) will be positive integers.
#     The solution set must not contain duplicate combinations.
#     Example 1:
#
#     Input: candidates = [10,1,2,7,6,1,5], target = 8,
#     A solution set is:
#                        [
#                            [1, 7],
#                            [1, 2, 5],
#                            [2, 6],
#                            [1, 1, 6]
#                        ]
# Example 2:
#
#     Input: candidates = [2,5,2,1,2], target = 5,
#     A solution set is:
#                        [
#                            [1,2,2],
#                            [5]
#                        ]

class CombinationSumII
  def combination_sum2(candidates, target)
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
        next if i > index && candi[i] == candi[i-1] # remove duplicate
        if candi[i] > target
          break
        end
        backtrack(candi, target-candi[i], i+1, temp+[candi[i]], res)
      end
    end
  end
end

c = CombinationSumII.new
p c.combination_sum2([10, 1, 2, 7, 6, 1, 5], 8)