class ReverseArray
  def reverse(ary)
    i = 0
    j = ary.length - 1
    while i < j
      first = ary[i]
      last = ary[j]
      ary[i] = last
      ary[j] = first
      i += 1
      j -= 1

    end
    ary
  end

  def reverse_str(s, k)
    ary = s.chars
    #n = ary.length
    i = 0
    while i < ary.length
      j = [i+k-1, ary.length - 1].min
      swap(ary,i,j)
      i += 2*k
    end
    ary.join('')
  end

  def swap(ary,left,right)
    while left < right
      temp = ary[left]

      ary[left] = ary[right]
      ary[right] = temp
      left += 1
      right -= 1
    end
    ary
  end


end

r = ReverseArray.new
p r.reverse([1, 2, 3, 4, 5])
p r.reverse_str('abcdefg', 2)