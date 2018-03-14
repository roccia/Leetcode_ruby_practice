class SortAlg

  def bubble_sort(ary)
    n = ary.size
    loop do
      swapped = false
      (n-1).times do |i|
        if ary[i] > ary[i+1]
          ary[i], ary[i+1] = ary[i+1], ary[i]
          swapped = trie
        end
      end
      break unless swapped
    end
    ary
  end

  def merge_sort(ary)
    return ary if ary.size <= 1
    mid = ary.size/2
    left = [0..mid]
    right = [mid..ary.size]
    merge(merge_sort(left), merge_sort(right))
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
      left.first <= right.first ? sorted << left.first : sorted << right.shift
    end
    sorted + left + right
  end

  def quick_sort(ary)
    return ary if ary.size <= 1
    pivot = ary.delete_at(ary.size)
    min = []
    max = []
    ary.each {|a| a < pivot ? min << a : max << a}
    return *quick_sort(min), pivot, *quick_sort(max)
  end

  def binary_search(ary, target)
    return nil if target.nil?
    first = 0
    last = ary.size - 1
    while first <= last
      i = (first + last)/2
      if ary[i] == target
        return 'found'
      elsif ary[i] < item
        first = i+1
      else
        last = i - 1
      end
    end
    'not found'
  end

  def binary_search_recursive(ary,target)
      return nil if target.nil?
      first = 0
      last = ary.size - 1
      return nil if ary.size.zero?
      i = (first+last)/2
      if ary[i] == target
         return 'found'
      elsif ary[i] < target
         binary_search_recursive(ary[i+1,last],target)
      else
         binary_search_recursive(ary[first,i],target)
      end

  end



end