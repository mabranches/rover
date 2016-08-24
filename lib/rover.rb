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
    send("move_#{position.cardeal_point.downcase}")
  end

  #move north
  def move_n
    position.y += 1
  end

  #move south
  def move_s
    position.y -= 1
  end

  #move west
  def move_w
    position.x -= 1
  end

  #move east
  def move_e
      position.x += 1
  end

  #check if position is inside plateu
  def adjust_position
    position.x = [position.x, @plateu.width].min
    position.x = [position.x, 0].max
    position.y = [position.y, @plateu.length].min
    position.y = [position.y, 0].max
  end
end
