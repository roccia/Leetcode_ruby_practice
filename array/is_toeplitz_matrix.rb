class IsToeplitzMatrix
  def is_toeplitz_matrix(matrix)
    (0...matrix.size - 1).each do |m|
      (0...matrix[m].size - 1).each do |n|
        return false if matrix[m][n] != matrix[m+1][n+1]
      end
    end
    true
  end
end

i = IsToeplitzMatrix.new
p i.is_toeplitz_matrix([
                           [1, 2, 3, 4],
                           [5, 1, 2, 3],
                           [9, 1, 1, 2]
                       ])