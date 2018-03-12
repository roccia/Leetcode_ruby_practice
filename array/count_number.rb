#lintcode
#[
#    [-5,-3,-1,0,1],
#    [-2,-1,0,0,1],
#    [0,11,12,12,14]
#],
#return 5
#给一个横向排序的且纵向也排序的的 n * m的矩阵， 问里面有几个负数
class CountNumber

  def countNumber(nums)
    count = 0
    n = nums.size

    # Write your code here
    m = nums[0].size
    i = 0
    j = m - 1
    while j >= 0 and i < n :
      if nums[i][j] < 0
        count += j + 1
        i+=1
      else
        j -= 1
      end
    end
    count
  end
end

