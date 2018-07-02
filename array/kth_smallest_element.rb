# Given a n x n matrix where each of the rows and columns are sorted in ascending order, find the kth smallest element in the matrix.
#
#     Note that it is the kth smallest element in the sorted order, not the kth distinct element.
#
#     Example:
#
#     matrix = [
#         [ 1,  5,  9],
#         [10, 11, 13],
#         [12, 13, 15]
#     ],
#         k = 8,
#
#         return 13.

class KthSmallestElement
  def kth_smallest(matrix, k)
    ary = matrix.flatten.sort
    ary[k-1]
  end

  def kth_smallest_bs(matrix, k)
    low = matrix[0][0]
    high = matrix[matrix.size - 1][matrix[0].size - 1]
    while low < high
      mid = low + (high - low)/2
      count = 0
      j = matrix[0].size - 1
      (0...matrix.size).each do |i|
        while j > 0 && matrix[i][j] > mid
          j -= 1
        end
        count += j + 1
      end
      if count < k
        low = mid + 1
      else
        high = mid
      end
    end
    low
  end

end

k = KthSmallestElement.new
p k.kth_smallest([
                     [1, 5, 9],
                     [10, 11, 13],
                     [12, 13, 15]
                 ], 8)
p k.kth_smallest_bs([
                        [1, 5, 9],
                        [10, 11, 13],
                        [12, 13, 15]
                    ], 8)