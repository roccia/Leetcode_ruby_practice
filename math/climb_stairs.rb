#一个人爬楼梯，每次只能爬1个或两个台阶，假设有n个台阶，那么这个人有多少种不同的爬楼梯方法
# @param n: 总的台阶数
# @param m: 每次可以走的最大的阶数
class ClimbStairs
  def climb(n, m)
      res = Array.new(n)
       res[0],res[1] = 1,1
      (2..n).each do |i|
         j = 1
         while j <=m && j <= i
            res[i] = res[i] + res[i-j]
            j = j+1
         end
      end
    res[n-1]
  end

end

c = ClimbStairs.new
c.climb(4 + 1, 2)