class Polygon


  def cal_edge(p1, p2)
    if p1[:x] == p2[:x]
      edge = (p1[:y] - p2[:y]).abs
    elsif p1[:y] == p2[:y]
      edge = (p1[:x]-p2[:x]).abs
    end
    edge
  end


  def cal_perimeter(ary)
    len = 0
    last = ary.last
    0.upto(ary.size) do |i|
      len += cal_edge(ary[i], ary[i+1])
      break if ary[i+1] == last
    end
    len + cal_edge(ary.first, ary.last)
  end

  def k_cordinates(ary,k)
      k_size = cal_perimeter(ary)/k.to_f
      hash = {}
      hash[0] = {x:0,y:0}

       res = Array.new(5)
      1.upto(ary.size) do |i|

          a_len = cal_edge(ary[i], ary[i+1])

          p a_len.to_f

          if  a_len.to_f <= k_size
              res << {x:k_size - a_len, y:ary[i][:y]}
          else
             p " 大于k_size : #{a_len.to_f}"
              res << {x:ary[i][:x],y:a_len - k_size}

          end

      end
    res
  end
end


ary = [{x: 0, y: 0}, {x: 0, y: 1}, {x: 1, y: 1}, {x: 1, y: 2}, {x: 2, y: 2}, {x: 2, y: 0}]

p = Polygon.new
p p.k_cordinates(ary,5)