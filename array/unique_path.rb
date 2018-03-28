class UniquePath
  def unique_paths(m, n)
    grid = Array.new(m) { Array.new(n) }
    m.times do |i|
       grid[i][0] = 1
    end
    n.times do |j|
       grid[0][j] = 1
    end
    
    1.upto(m-1).each do |i|
      1.upto(n-1).each do |j|
          grid[i][j] = grid[i][j-1] + grid[i-1][j]
        end

      end
        grid[m-1][n-1]    
    end


 end


u = UniquePath.new()
p u.unique_paths(3,7)