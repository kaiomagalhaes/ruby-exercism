# frozen_string_literal: true

# Can be found at: http://exercism.io/submissions/3aed1d0d61074cdabdc58153964d3841
class School
  def initialize
    @students = Hash.new { |hsh, key| hsh[key] = [] }
  end

  def add(name, grade)
    @students[grade] << name
  end

  def grade(grade)
    @students[grade].sort
  end

  def to_hash
    @students.sort.each_with_object({}) do |(key, value), hsh|
      hsh[key] = value.sort
    end
  end
end
