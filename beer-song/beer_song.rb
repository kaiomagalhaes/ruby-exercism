class BeerSong

  def verse num_bottles
    final_bottles = num_bottles> 0 ? num_bottles-1: 99
    create_sentence num_bottles, final_bottles
  end

  def verses final, init
    t = ""
    (init..final).to_a.reverse.each do |n|
      t << "#{verse(n)}\n"
    end
    puts t
    t
  end
  def sing
    verses(99,0)
  end
  private

  def create_sentence(init_number, final_number)
    is_plural = init_number != 1
    first_sentence(init_number, is_plural) + second_sentence(final_number,is_plural)
  end
  def first_sentence num_bottles, plural
    word_end = plural ? 's' : ''
    number_bottles_sentence = num_bottles == 0 ? "No more" : num_bottles
    number_sentence ="#{number_bottles_sentence} bottle#{word_end} of beer"
    "#{number_sentence} on the wall, #{number_sentence.downcase}.\n"
  end

  def second_sentence num_bottles, plural
    return "Go to the store and buy some more, 99 bottles of beer on the wall.\n" if num_bottles == 99
    take_what = plural ? 'one' : 'it'
    beers_left =num_bottles == 0? "no more" : num_bottles 
    word_end = num_bottles == 1 ? '' : 's'
    "Take #{take_what} down and pass it around, #{beers_left} bottle#{word_end} of beer on the wall.\n"
  end
end
