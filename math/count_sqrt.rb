class CountSqrt


  def count_sqrt(a,b)
    return 0 if b<=0 || b < a
    return  1 if a ==0 || b == 1
    if a <= 0
      a = 1
    end
    Math.sqrt(b).to_i - Math.sqrt(a-1).to_i

  end


end

c = CountSqrt.new
p c.count_sqrt(4,17)