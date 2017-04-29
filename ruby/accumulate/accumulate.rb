# frozen_string_literal: true

# Can be found at: http://exercism.io/submissions/ea31a905ffc34975b541302f5089dc20
module Enumerable
  def accumulate
    each_with_object([]) { |value, result| result << yield(value) }
  end
end
