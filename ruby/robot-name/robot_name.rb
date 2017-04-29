class Robot
  @@used_names = []

  def name
    @name ||= mount_name
  end

  def reset
    @@used_names.delete @name
    @name = nil
  end

  private

  def mount_name
    name = rand_char(2).join + rand_number(3).join
    return mount_name if @@used_names.include? name
    @@used_names << name
    name
  end

  def rand_char(amount)
    (1..amount).map { ('A'..'Z').to_a[rand(0...25)] }
  end

  def rand_number(amount)
    (1..amount).map { rand(0...9) }
  end
end
