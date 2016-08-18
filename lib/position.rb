class Position

  CARDEAL_POINTS = ['N', 'E', 'S', 'W']
  attr_accessor :x, :y, :direction
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = CARDEAL_POINTS.
      find_index{|cp| cp == direction}
  end
end
