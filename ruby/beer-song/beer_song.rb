# frozen_string_literal: true

# Can be found at: http://exercism.io/submissions/825705c47d9947d18b07991a0d28b0eb
class BeerSong
  def verses(last, first)
    (first..last).collect { |n| "#{verse(n)}\n" }.reverse.join
  end

  def verse(number)
    sentences(number)
  end

  def sing
    verses(99, 0)
  end

  private

  def sentences(number)
    plural = number != 1
    "#{first_sentence(number, plural)}#{second_sentence(number, plural)}"
  end

  def first_sentence(number, plural)
    if number.positive?
      "#{number} #{bootle(plural)} of beer on the wall, "\
        "#{number} #{bootle(plural)} of beer.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n"
    end
  end

  def second_sentence(number, plural)
    if number.positive?
      "Take #{article(plural)} down and pass it around,"\
       " #{second_sentence_number_text(number)} of beer on the wall.\n"
    else
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def second_sentence_number_text(number)
    current_last_number = number - 1
    plural = current_last_number != 1
    bootle_word = bootle(plural)
    sentence = current_last_number.zero? ? 'no more' : current_last_number
    "#{sentence} #{bootle_word}"
  end

  def bootle(plural)
    "bottle#{termination(plural)}"
  end

  def article(plural)
    plural ? 'one' : 'it'
  end

  def termination(plural)
    plural ? 's' : ''
  end
end
