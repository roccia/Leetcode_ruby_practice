class CountSqrt


  def count_sqrt(a,b)
     count = 0
     (a..b-1).each do |i|
        j = 1
        while j*j <= i
           if j*j == 1
               count +=  1
               j += 1
           end
           i += 1
        end


     end
     count

  end


end

c = CountSqrt.new
p c.count_sqrt(4,17)