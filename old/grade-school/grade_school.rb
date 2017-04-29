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