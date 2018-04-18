# Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
#
# Note:
# You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
# The number of elements initialized in nums1 and nums2 are m and n respectively.
class MergeSortedArray

  def merge_ary(nums1, m, nums2, n)
    i = m - 1
    j = n - 1
    k = m + n - 1
    while i >= 0 && j >= 0
      if nums1[i] > nums2[j]
        nums1[k] = nums1[i]
        k -= 1
        i -= 1
      else
        nums1[k] = nums2[j]
        k -= 1
        j -= 1
      end
    end
    while j >= 0
      nums1[k] = nums2[j]
      k -= 1
      j -= 1
    end
    nums1
  end

end

m = MergeSortedArray.new

 p m.merge_ary([1, 3, 5], 3, [2, 4], 2)
