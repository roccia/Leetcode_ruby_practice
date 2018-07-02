class FlipAndInvertImage
  def flip_and_invert_image(a)
    b = a.map {|i| i.reverse}
    c = b.map {|row| row.map {|i| i=(i==1 ? 0 : 1)}}
    c
  end
end

f = FlipAndInvertImage.new
p f.flip_and_invert_image([[1, 1, 0], [1, 0, 1], [0, 0, 0]])