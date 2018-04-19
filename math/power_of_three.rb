#Given an integer, write a function to determine if it is a power of three.


class PowerOfThree
  def is_power_of_three(n)
    return false if n <= 0
    while n % 3 == 0
      n /= 3
    end
    return n == 1
  end

  def is_power_of_three_math(n)
      n > 0 and 3 ** 19 % n == 0
  end
end