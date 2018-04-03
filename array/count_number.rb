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
    row = 0
    col = rows - 1
    while col >= 0 and row < rows
      if nums[row][col] < 0
        count += col + 1
        row+=1  #向下移动
      else
        col -= 1  #向左移动
      end
    end
     count
  end

#Search a 2D Matrix
  def search_matrix(matrix, target)
    return false if matrix.nil? ||  matrix.size < 1 || matrix[0].size < 1
    row = 0
    col = matrix[0].size - 1
    while col >= 0 && row <=  matrix.size - 1
      if target == matrix[row][col]
        return true
      elsif target < matrix[row][col]
        col -= 1  #向左移动
      else
        row += 1  #向下移动
      end
    end
     false
  end



end

ary = [
   [-5,-3,-1,0,1],
   [-2,-1,0,0,1],
   [0,11,12,12,14]
]
ary1 = [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]
]
ary2 = [[-1],[-1]]
c = CountNumber.new
p c.countNumber(ary)
p c.search_matrix(ary2,-2)