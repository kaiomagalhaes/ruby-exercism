class Raindrops
  RULES = [[3, 5, 7], %w[Pling Plang Plong]].transpose

  def self.convert(num)
    result = RULES.map do |key, value|
      value if num % key == 0
    end
    result.any? ? result.join : num.to_s
  end
end
