class Card
  attr_reader :value, :facedown
  def initialize(value)
    @value = value
    @facedown = true
  end

  def hide
    @facedown = true
  end

  def reveal
    @facedown = false
    @value
  end

  def to_s
    @value.to_s
  end

  def ==(other_value)
    other_value == @value
  end

end