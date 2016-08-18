class Rover
  attr_reader :position
  def initialize(plateu, start_position)
    @plateu = plateu
    @position = start_position
  end

  def run(movements)
    movements.each_char do |m|
      send(m.downcase)
    end
  end

  private
  #rotate left
  def l
    rotate_aux(:-)
  end

  #rotate right
  def r
    rotate_aux(:+)
  end

  def rotate_aux(dir)
    position.direction = position.direction.send(dir, 1) %
                            Position::CARDEAL_POINTS.length
  end

  #move foward
  def m
    cardeal_point = Position::CARDEAL_POINTS[position.direction]
    case cardeal_point
    when 'N'
      position.y += 1
    when 'S'
      position.y -= 1
    when 'E'
      position.x += 1
    when 'W'
      position.x -= 1
    end
    adjust_position
  end

  def adjust_position
    position.x = [position.x, @plateu.width].min
    position.x = [position.x, 0].max
    position.y = [position.y, @plateu.length].min
    position.y = [position.y, 0].max
  end
end
