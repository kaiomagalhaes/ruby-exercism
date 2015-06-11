class Complement

  DNA_DICTIONARY = {
      "G"=> "C",
      "C"=> "G",
      "T"=> "A",
      "A"=> "U"
  }

  def self.of_dna(dna)
    of dna, DNA_DICTIONARY
  end

  def self.of_rna(rna)
    of rna, DNA_DICTIONARY.invert
  end

  private

  def self.of(sequence, dictionary)

    sequence.each_char.map { |base|
      translated_base = dictionary[base]
      raise ArgumentError if translated_base.nil?
      translated_base
    }.join

  end

end