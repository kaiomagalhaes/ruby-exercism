class Series
  def initialize(serie_base)
    @serie_base = serie_base
  end

  def slices(amount)
    raise ArgumentError if @serie_base.size < amount

    @serie_base.chars.map(&:to_i).each_cons(amount).to_a
  end
end
