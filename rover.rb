require_relative 'rover_direction'

class Rover
  attr_accessor :id, :dir

  def initialize(index, x, y, face)
    @id = index
    @dir = RoverDirection.new(x, y, face)
  end

  # current location of rover
  def print_current_location
    puts [@dir.x_value, @dir.y_value, @dir.face].join(' ')
  end

  # move forward
  def move
    @dir.move_forward
  end

  # turn right
  def rotate_right
    @dir.turn_right
  end

  # turn left
  def rotate_left
    @dir.turn_left
  end
end
