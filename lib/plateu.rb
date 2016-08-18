class Plateu
  attr_accessor :width, :length
  def initialize(width, length)
    @length = length.to_i
    @width = width.to_i
  end
end
