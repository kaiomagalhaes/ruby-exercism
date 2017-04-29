class Trinary
  def initialize number
    @trinary = number
  end

  def to_decimal
    chars = @trinary.reverse.each_char
    chars.with_index.reduce(0) do |amount, (char, i)|
      amount + char.to_i * (3**i)
    end
  end
end