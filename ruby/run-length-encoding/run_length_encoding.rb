class RunLengthEncoding
  def self.encode(input)
    list = input.split('')
    count = 0
    result = ''
    actual_letter = nil

    list.each_with_index do |letter, i|
      last_letter = list[i - 1] if i > 0
      is_last_letter = i == (list.size - 1)
      count = count.next if is_last_letter
      if last_letter == letter && !is_last_letter
        count = count.next
      else
        if last_letter != letter && is_last_letter
          result << letter
        elsif actual_letter
          result << (count > 1 ? "#{count}#{actual_letter}" : actual_letter)
        end
        count = 1
        actual_letter = letter
      end
    end
    result
  end

  def self.decode(_input); end
end
