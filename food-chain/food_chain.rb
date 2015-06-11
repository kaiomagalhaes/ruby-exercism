class FoodChain

  @animals = %w[fly spider bird cat dog goat cow horse ]

  @animals_phrases = {
      "bird"=> "How absurd to swallow a bird!\n",
      "cat"=> "Imagine that, to swallow a cat!\n",
      "dog"=> "What a hog, to swallow a dog!\n",
      "goat"=> "Just opened her throat and swallowed a goat!\n",
      "cow"=> "I don't know how she swallowed a cow!\n"
  }


  def self.song
    swallowed_animals = []
    sentence = ""
    @animals.each{ |animal|
      animal_is_not_horse = animal != 'horse'
      sentence << first_sentence(animal)
      sentence << animal_phrase(animal)
      swallowed_animals << animal
      if animal_is_not_horse
        swallowed_animals.reverse.each_with_index {|swallowed_animal,index|
          swallowed_animal_aux = swallowed_animals.reverse[index.next]
          sentence << swallowed_to_catch(swallowed_animal, swallowed_animal_aux)
        }
      end
      last_animal_swallowed = swallowed_animals.last if animal_is_not_horse
      sentence << swallowed_to_catch(animal, last_animal_swallowed) if last_animal_swallowed
      sentence <<  last_sentence(animal)
      sentence
    }
    sentence
  end

  private

  def self.first_sentence(animal)
    first_sentence_phrase = "I know an old lady who swallowed a #{animal}.\n"
    first_sentence_phrase << "It wriggled and jiggled and tickled inside her.\n" if animal == "spider"
    first_sentence_phrase
  end

  def self.animal_phrase(animal)
    phrase = @animals_phrases[animal]
    phrase ||= ""
    phrase
  end

  def self.swallowed_to_catch(first, last)
    return "" if !first || !last || first == last
    swallowed_to_catch_phrase = "She swallowed the #{first} to catch the #{last}"
    swallowed_to_catch_phrase << (last != "spider" ? "." : " that wriggled and jiggled and tickled inside her.")

    swallowed_to_catch_phrase + "\n"
  end

  def self.last_sentence(animal)
    animal != "horse" ? "I don't know why she swallowed the fly. Perhaps she'll die.\n\n": "She's dead, of course!\n"

  end

end