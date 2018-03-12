#剑指offer
#在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。


class Find
  def find(matrix, target)
    return false if matrix.nil? || matrix.size < 1 || matrix[0].size < 1
    rows = matrix.size #数组行数
    cols = matrix[0].size #数组列数

    row = 0 #起始行号
    col = cols - 1 #起始列号

    #要查找的位置确保在数组之内
    while row >= 0 && row < rows && col >=0 && col < cols
      if matrix[row][col] == target
        return true
      elsif matrix[row][col] > target #如果找到的数比要找的数大，说明要找的数在当前数的左边
        col -= 1 #列数减一，代表向左移动
      else  # 如果找到的数比要找的数小，说明要找的数在当前数的下边
        row += 1 #行数加一，代表向下移动
      end
    end
     false
  end
end

f = Find.new()
matrix = [[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,16]]
p f.find(matrix,21)