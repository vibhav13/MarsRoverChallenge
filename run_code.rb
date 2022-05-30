require_relative 'rover'
require_relative 'grid'

class StartRover
  attr_accessor :grid, :rover

  # check if top right grid coordinates are correct or not
  def check_grid_coordinates?(topRight_x, topRight_y)
    result = Integer(topRight_x) && Integer(topRight_y) rescue false
    result
  end

  # take the coordinates for grid from the user
  def input_grid_coordinates
    topRight_x, topRight_y = gets.chomp.split(' ')
    raise ArgumentError, 'grid coordinates are not correct' unless \
      check_grid_coordinates?(topRight_x, topRight_y)
    @grid = Grid.new(topRight_x.to_i, topRight_y.to_i)
  end

  # starts the rover operations
  def start_rovers_operations
    STDIN.each_slice(2).each_with_index do |lines, index|
      rover_coordinate_x, rover_coordinate_y, rover_facing_RoverDirection = lines[0].split

      # check if coordinates are valid or not
      unless @grid.valid?(rover_coordinate_x.to_i, rover_coordinate_y.to_i, rover_facing_RoverDirection.to_s)
        puts 'rover coordinates or other parameters are incorrect: ' \
             "(#{rover_coordinate_x}, #{rover_coordinate_y}, #{rover_facing_RoverDirection})"
        next
      end

      # create rover object with coordinates and facing value
      @rover = Rover.new(index, rover_coordinate_x.to_i, rover_coordinate_y.to_i, rover_facing_RoverDirection.to_s)

      catch :invalid_operation do
        # run each operation in sequential order
        lines[1].chomp.each_char do |operation|
          throw :invalid_operation unless send_operations_to_rover(operation)
        end
      end

      next unless @rover.id != -1
      @rover.print_current_location
    end
  end

  # send the operations to rover
  def send_operations_to_rover(operation)
    case operation
    when 'L'
      @rover.rotate_left
    when 'M'
      @rover.move
    when 'R'
      @rover.rotate_right
    else
      puts "operation is not correct'#{operation}'. " \
           'only use operations from: R, M or L'
      # Invalidate rover if operation is not valid
      @rover.id = -1
      return false
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Enter your input to see the progress!"
  Startrover = StartRover.new
  Startrover.input_grid_coordinates
  Startrover.start_rovers_operations
end
