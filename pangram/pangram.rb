class Pangram
  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]

  def self.is_pangram?(str)
    str_list = str.downcase.gsub(/[^a-z]/, '')
    str_list = str_list.split('').uniq.sort

    ALPHABET == str_list
  end
end
