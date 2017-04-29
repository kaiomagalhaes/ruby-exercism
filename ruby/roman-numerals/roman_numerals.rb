class Integer
  DICTIONARY = {
    1000 => 'M',
    500 => 'D',
    100 => 'C',
    50 => 'L',
    10 => 'X',
    5 => 'V',
    1 => 'I',
    0 => ''
  }.freeze

  def to_roman
    number_to_convert = freeze
    hundreds = find_house number_to_convert, 100
    dozens = find_house (number_to_convert - hundreds), 10
    units = find_house (number_to_convert - hundreds - dozens), 1
    "#{to_roman_algorism hundreds}#{to_roman_algorism dozens}#{to_roman_algorism units}"
  end

  private

  def to_roman_algorism(number_to_convert)
    left_number = find_left_number number_to_convert
    "#{convert left_number}#{convert (number_to_convert + left_number)}"
  end

  def convert(number_to_convert)
    result = DICTIONARY.map do |number, roman_algorism|
      result = ''
      while number <= number_to_convert && number_to_convert > 0
        number_to_convert -= number
        result << roman_algorism
      end
      result
    end.join
  end

  def find_left_number(number)
    keys = DICTIONARY.keys.sort
    return 0 if keys.include? number
    first_major = keys.detect { |n| n > number }
    left_number = keys.detect { |n| (n + number) == first_major }
    left_number ? left_number : 0
  end

  def find_house(number, house)
    (number / house) * house
  end
end
