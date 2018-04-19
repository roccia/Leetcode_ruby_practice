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