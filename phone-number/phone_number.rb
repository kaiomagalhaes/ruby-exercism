class PhoneNumber
  attr_reader :number

  DEFAULT_NUMBER = '0000000000'
  VALID_NUMBER_REGEX = /^\d{10}$|(?<=^1)\d{10}$/

  def initialize(phone_number)
    @number = cleanup phone_number
  end

  def area_code
    @area_code ||= @number.slice(0, 3)
  end

  def to_s
    @number_s = "(#{area_code}) #{@number.slice(3..5)}-#{@number.slice(6..9)}"
  end

  private

  def cleanup(phone_number)
    cleaned_number = phone_number.gsub(/\W/, '')
    number = cleaned_number.scan(VALID_NUMBER_REGEX)
    number.empty? ? DEFAULT_NUMBER : number.first
  end
end