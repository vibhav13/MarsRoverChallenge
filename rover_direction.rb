class RoverDirection
  attr_accessor :x_value, :y_value, :face

  north = {
    'L' => 'W',
    'R' => 'E'
  }

  south = {
    'L' => 'E',
    'R' => 'W'
  }

  east = {
    'L' => 'N',
    'R' => 'S'
  }

  west = {
    'L' => 'S',
    'R' => 'N'
  }

  @@RoverDirection_hash = {
    'N' => north,
    'S' => south,
    'E' => east,
    'W' => west
  }

  @@axis_hash = {
    'N' => 'Y',
    'S' => 'Y',
    'E' => 'X',
    'W' => 'X'
  }

  @@value_hash = {
    'N' => 1,
    'S' => -1,
    'E' => 1,
    'W' => -1
  }

  def initialize(x, y, face)
    @x_value = x
    @y_value = y
    @face = face
  end

  # method to turn left
  def turn_left
    @face = @@RoverDirection_hash[@face]['L']
  end

  # method to turn right
  def turn_right
    @face = @@RoverDirection_hash[@face]['R']
  end

  # method to move forward
  def move_forward
    if @@axis_hash[@face] == 'X'
      @x_value += @@value_hash[@face]
    elsif @@axis_hash[@face] == 'Y'
      @y_value += @@value_hash[@face]
    end
  end
end
