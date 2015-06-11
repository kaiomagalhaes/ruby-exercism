class SumOfMultiples

  def initialize(*base_multiples)
    @base_multiples = base_multiples
  end

  def to(number)
    (3...number).select { |n| multiple?(n) }.inject(0,&:+)
  end

  def self.to(number)
    SumOfMultiples.new(3,5).to(number)
  end

  private

  def multiple?(number)
    @base_multiples.any?{|base| number % base == 0}
  end

end