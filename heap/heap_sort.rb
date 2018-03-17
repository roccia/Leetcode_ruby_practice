class HeapSort

  def heap_sort(keys)
    build_max_heap(keys)
    (keys.size-1).downto(1) do |i|
      keys[0], keys[i] = keys[i], keys[0]
      max_heapify(keys, i, 0)
    end
    keys
  end

  def k_largest(nums, k)
    build_max_heap(nums)
    nums_size = nums.size
    index = 0
    while index < k
      ele_max = extract_max(nums, nums_size)
      nums_size -= 1
      index += 1
    end
    ele_max
  end

  def k_min(nums, k)
    new_ary = []
    nums.each do |n|
      if new_ary.size < k
        new_ary << n
      else
        new_ary = build_max_heap(new_ary)
        next if n >= new_ary[0]
        new_ary[0] = n
      end
    end
    new_ary
  end

  def extract_max(keys, size)
    root = keys[0]
    keys[0] = keys[size-1]
    max_heapify(keys, size-1, 0)
    root
  end


  def build_max_heap(keys)
    (keys.size/2-1).downto(0) do |i|
      max_heapify(keys, keys.size, i)
    end
    keys
  end

  def max_heapify(keys, size, i)
    l = 2*i+1
    r = 2*i+2

    if l < size and keys[l] > keys[i]
      largest = l
    else
      largest = i
    end

    if r < size and keys[r] > keys[largest]
      largest = r
    end

    if largest != i
      keys[i], keys[largest] = keys[largest], keys[i]
      max_heapify(keys, size, largest)
    end
  end

end

h = HeapSort.new
ary = [9, 4, 5, 2, 1, 23, 55, 88, 74, 89]
ary1 = [4, 5, 1, 6, 2, 7, 3, 8]


#h.heap_sort(ary1)
# h.k_largest(ary, 3)

p h.k_min(ary, 4)
#p  h.extract_max(ary,4)