class CountStep

  def test(n)
    l, r = 0, 1
    curr_path = ''
    res_path = []
    count(l, r, n, curr_path, res_path)
    res_path[0].size
  end

  def count(l, r, n, curr_path, res_path)
    return if res_path.size != 0 and curr_path.size >= res_path.size

    if l == n or r == n
      if res_path.size == 0
        res_path.push(curr_path)
      else
        curr_path.size < res_path.size ? res_path.push(curr_path) : res_path
      end
      res_path
    end

    a = (2 * l - r).abs
    b = (2 * r - l).abs
    if a <= n.abs
      count(2 * l - r, r, n, curr_path + "L", res_path)
    end
    if b <= n.abs
      count(l, 2 * r - l, n, curr_path + "R", res_path)
    end

  end

end


c = CountStep.new()
p c.test(2147483647)