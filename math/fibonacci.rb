#用递推法计算斐波那契(Fibonacci)数列的第 n 项.
#time O(n) space O(1)
class Fibonacci
  def get_n(n)
    f0 = 0
    f1 = 1
    f2 = 0
    return 'incorrect input' if n < 0
    return f0 if n == 0
    return f1 if n == 1
    (2..n).each do
      f2 = f0 + f1
      f0 = f1
      f1 = f2
    end
    f2
  end
end

f = Fibonacci.new
p f.get_n(13)