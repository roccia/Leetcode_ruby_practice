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
    rows = nums.size

    # Write your code here
    cols = nums[0].size
    row = 0
    col = rows - 1
    while j >= 0 and row < rows :
      if nums[row][col] < 0
        count += col + 1
        row+=1  #向下移动
      else
        col -= 1  #向左移动
      end
    end
    count
  end
end

