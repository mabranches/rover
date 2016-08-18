#5 5
#
#1 2 N
#
#LMLMLMLMM
#
#3 3 E
#
#MMRMMRMRRM
#
#
require 'byebug'
Dir["./lib/*"].each {|file| require file }

plateu_pos = gets.strip.split(' ')
plateu = Plateu.new(*plateu_pos)
while(rover_pos = gets)
  rover_pos = rover_pos.strip.split
  rover = Rover.new(plateu, Position.new(*rover_pos))
  rover.run(gets.strip)
  puts "#{rover.position.x} #{rover.position.x} #{rover.position.cardeal_point}"
end
