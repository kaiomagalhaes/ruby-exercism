class Binary
  def initialize(binary_number)
    @binary_number = binary_number
  end

  def to_decimal
    @decimal_number ||= do_conversion.to_i
  end

  private

  def do_conversion
    return 0 unless @binary_number =~ /^[01]+*$/
    bynaries = @binary_number.reverse.each_char
    bynaries.with_index.reduce(0) do |amount, (number, index)|
      amount + (2**index) * number.to_i
    end
  end
end
