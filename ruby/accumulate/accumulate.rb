module Enumerable
  def accumulate
    each_with_object([]) { |value, result| result << yield(value) }
  end
end
