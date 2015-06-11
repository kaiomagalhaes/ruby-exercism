class Phrase

  def initialize(phrase)
    @words = phrase.downcase.scan(/[\w']+/)
  end

  def word_count
    @word_count ||= words_counted
  end

  private

  def words_counted
    @word_count = @words.each_with_object(Hash.new(0)) {
        |word, hash| hash[word] +=1
    }
  end

end