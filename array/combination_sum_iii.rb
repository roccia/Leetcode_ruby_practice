class CombinationSumIII
  def combination_sum3(k, target)
    res = []
    temp = []
    nums = [1,2,3,4,5,6,7,8,9]

    backtrack(nums, target, 0, temp, res,k)
    res
  end

  def backtrack(candi, target, index, temp, res,k)

    if target < 0
      return
    elsif target == 0 && temp.size == k
      res << temp
    else
      (index...candi.size).each do |i|
        next if i > index && candi[i] == candi[i-1] # remove duplicate
        if candi[i] > target
          break
        end
        backtrack(candi, target-candi[i], i+1, temp+[candi[i]], res,k)
      end
    end
  end


end


  c = CombinationSumIII.new
p  c.combination_sum3(3,9)