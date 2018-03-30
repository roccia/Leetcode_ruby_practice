#P[i][j] = P[i - 1][j] + P[i][j - 1].
# initialize P[0][j] = 1, P[i][0] = 1 for all valid i, j

class UniquePath
  def unique_paths(m, n)
    grid = Array.new(m) {Array.new(n)}
    m.times {|i| grid[i][0] = 1}
    n.times {|j| grid[0][j] = 1}


    1.upto(m-1).each do |i|
      1.upto(n-1).each do |j|
        grid[i][j] = grid[i][j-1] + grid[i-1][j]
      end
    end
    grid[m-1][n-1]
  end


end


u = UniquePath.new()
p u.unique_paths(3, 7)