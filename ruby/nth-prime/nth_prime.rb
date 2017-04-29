class Prime
  def nth(number)
    raise ArgumentError if number == 0
    prime_numbers = [2]
    nth = init_value
    until prime_numbers.size == number
      prime_numbers << nth if prime? nth
      nth += step_value
    end
    prime_numbers.last
  end

  private

  def prime?(num)
    range = (init_value..(Math.sqrt(num))).step(step_value)
    range.none? { |n| num % n == 0 }
  end

  def init_value
    3
  end

  def step_value
    2
  end
end
