module Enumerable

  def accumulate
    self.each_with_object([]) {|value, result| result << yield(value)}
  end

end