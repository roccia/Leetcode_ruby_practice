class ReshapeMatrix
  def matrix_reshape(nums, r, c)
    return nums if nums.empty?
    #return false if nums.nil? || nums.size < 1 || nums[0].size < 1
    rows = nums.size #数组行数
    cols = nums[0].size #数组列数
    return nums if r*c != rows*cols
    nums.flatten.each_slice(c).to_a
  end
end

r = ReshapeMatrix.new
p r.matrix_reshape([[1, 2, 3],
                  [4, 5, 6]], 3, 2)