class PrimeFactors
  def self.for(base_num)
    range = (3..base_num).step(2)
    range = range.to_a.unshift(2)
    prime_factors = range.collect do |n|
      list = []
      result = base_num % n == 0
      while result
        list << n
        base_num /= n
        result = base_num % n == 0
      end
      list
    end
    prime_factors.flatten
  end
end
