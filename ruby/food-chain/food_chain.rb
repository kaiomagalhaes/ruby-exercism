
# Can be found at: http://exercism.io/submissions/b83d191cfc4745a8909b0c10536d8eb4
class FoodChain
  HORSE = 'horse'
  FLY = 'fly'
  SPIDER = 'spider'
  BIRD = 'bird'

  ANIMALS = [FLY, SPIDER, BIRD, 'cat', 'dog', 'goat', 'cow', HORSE].freeze

  ANIMALS_PHRASES = {
    'bird' => "How absurd to swallow a bird!\n",
    'cat' => "Imagine that, to swallow a cat!\n",
    'dog' => "What a hog, to swallow a dog!\n",
    'goat' => "Just opened her throat and swallowed a goat!\n",
    'cow' => "I don't know how she swallowed a cow!\n"
  }.freeze

  def self.song
    ANIMALS.each_with_index.collect do |animal, index|
      sentence = swallowed_sentence(animal)
      sentence << jingle_sentence(animal)
      sentence << animal_sentence(animal) if ANIMALS_PHRASES.keys.include?(animal)

      unless animal.equal?(HORSE)
        sentence << swallowed_to(ANIMALS[index - 1], animal) if index.positive?
        sentence << swallowed_to_sentences(index - 1)
      end

      sentence << die_sentence(animal)
    end.join
  end

  def self.swallowed_sentence(animal)
    "I know an old lady who swallowed a #{animal}.\n"
  end

  def self.die_sentence(animal)
    return "She's dead, of course!\n" if animal.equal?(HORSE)
    "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
  end

  def self.jingle_sentence(animal)
    return "It wriggled and jiggled and tickled inside her.\n" if animal.equal?(SPIDER)
    ''
  end

  def self.swallowed_to(prey, hunter)
    generic_sentence = "She swallowed the #{hunter} to catch the #{prey}.\n"
    return generic_sentence unless hunter.equal?(BIRD)

    "She swallowed the #{hunter} to catch the #{prey} that wriggled and jiggled and tickled inside her.\n"
  end

  def self.animal_sentence(animal)
    ANIMALS_PHRASES[animal]
  end

  def self.swallowed_to_sentences(index)
    return '' unless index.positive?
    (1..index).collect do |i|
      prey = ANIMALS[i]
      hunter = ANIMALS[i - 1]
      swallowed_to(hunter, prey) unless prey.equal?(HORSE)
    end.reject(&:nil?).reverse.join
  end
end
