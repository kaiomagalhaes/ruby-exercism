class Bob
  def hey(remark)
    remark.delete!("\n")
    return 'Whoa, chill out!' if shouting? remark
    return 'Sure.' if question?(remark)
    return 'Fine. Be that way!' if silence? remark
    'Whatever.'
  end

  private

  def question?(remark)
    remark.match(/\?$/)
  end

  def shouting?(remark)
    remark == remark.upcase && remark.match(/[a-zA-Z]/)
  end

  def silence?(remark)
    remark.strip == ''
  end
end
