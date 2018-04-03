class CountPrimes
  def count_primes(n)
    return 0 if n < 3
    cache = Array.new n, true
    cache[0] = false
    cache[1] = false

    (2..n**(1.0/2)).each do |i|
      next unless cache[i]
      (i*i...n).step(i).each do |x|
        cache[x] = false
      end
    end
    p cache
    cache.count {|b| b}

  end
end


c = CountPrimes.new
p c.count_primes(100)