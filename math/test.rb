class Test

  def max_profit(prices)
    max_prof = 0
    1.upto(prices.size-1) do |i|

      max_prof += [(prices[i] - prices[i-1]),0].max
    end
   p max_prof
  end
end

c = Test.new

c.max_profit([2,1])