class Squares

  def initialize(num)
    @range = 1..num
  end

  def square_of_sums
    @range.reduce(:+) ** 2
  end

  def sum_of_squares
    @range.map {|value| value ** 2}.reduce(:+)
  end

  def difference
    square_of_sums - sum_of_squares
  end

end