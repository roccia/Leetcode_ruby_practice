# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
#     You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
#     Example:
#
#     Given nums = [2, 7, 11, 15], target = 9,
#
#           Because nums[0] + nums[1] = 2 + 7 = 9,
#     return [0, 1].
class TwoSum
  def two_sum(nums, target)
    hash = {}
    nums.each_with_index {|value, index|
      if diff = hash[target - value]
        return [diff, index]
      else
        hash[value] = index
      end
    }
  end

  def two_sum2(nums, target)
    l = 0
    r = nums.size - 1
    while l < r
      res = nums[l] + nums[r]
      if target == res
        return [l+1, r+1]
      elsif res < target
        l += 1
      else
        r -= 1
      end
    end
  end

  # Given a Binary Search Tree and a target number,
  # return true if there exist two elements in the BST such that their sum is equal to the given target.
  def two_sum4(root, k)
    nums = in_order(root)
    hash = Hash.new
    (0...nums.size).each do |i|
      temp = k - nums[i]
      if hash.has_key?(temp)
        return true
      end
      hash[nums[i]] = 1
    end
    false
  end

  def in_order(node)
    return [] if node.nil?
    ary = []
    ary.concat in_order(node.left)
    ary << node.val
    ary.concat in_order(node.right)
    ary
  end

  # two_sum4
  # def find_target(root, k)
  #   hash = {}
  #   return find(root, k, hash)
  #
  # end
  #
  # def find(root, k, hash)
  #   return false if root == nil
  #   if hash[k - root.val]
  #     return true
  #   end
  #   hash[root.val] = root.val
  #   return find(root.left, k, hash) || find(root.right, k, hash)
  # end
end