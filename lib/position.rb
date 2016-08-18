class Position

  CARDEAL_POINTS = ['N', 'E', 'S', 'W']
  attr_accessor :x, :y, :direction
  def initialize(x, y, direction)
    @x = x.to_i
    @y = y.to_i
    @direction = CARDEAL_POINTS.
      find_index{|cp| cp == direction}
  end

  def cardeal_point
    Position::CARDEAL_POINTS[direction]
  end
end
