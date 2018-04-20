class CombinationSumIV

  def combination_sum3(candidates, target)
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
      res << temp.dup
    else
      (index...candi.size).each do |i|
        #next if i > index && candi[i] == candi[i-1] # remove duplicate
        if candi[i] > target
          break
        end
        backtrack(candi, target-candi[i], i+1, temp+[candi[i]], res)
      end
    end
  end

end

 c = CombinationSumIV.new
 p  c.combination_sum3([1,2,3],4)