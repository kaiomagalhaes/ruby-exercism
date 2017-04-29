# frozen_string_literal: true

# Can be found at: http://exercism.io/submissions/0a25e94c12794edcbb412481337ba109
class ETL
  def self.transform(old_values)
    new_values = old_values.flat_map do |score, letters|
      letters.collect { |letter| [letter.downcase, score] }
    end
    new_values.to_h
  end
end
