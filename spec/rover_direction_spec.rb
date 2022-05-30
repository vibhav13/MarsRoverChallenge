# spec/RoverDirection_spec.rb

require_relative 'spec_helper'

describe RoverDirection do
  before :each do
    @dir = RoverDirection.new(1, 1, 'N')
  end

  describe '#new' do
    it 'returns RoverDirection class object' do
      expect(@dir).to be_a RoverDirection
    end

    it 'not to be nil' do
      expect(@dir).not_to be_nil
    end
  end

  describe 'turn left' do
    it 'returns new rover direction' do
      rest_faces = %w(N S E W) - [@dir.face]
      @dir.turn_left
      expect(rest_faces).to include @dir.face
    end

    it 'move towards left' do
      @dir.turn_left
      expect(@dir.face).to eq('W')
    end
  end

  describe 'turn right' do
    it 'returns new rover direction' do
      rest_faces = %w(N S E W) - [@dir.face]
      @dir.turn_right
      expect(rest_faces).to include @dir.face
    end

    it 'move towards right' do
      @dir.turn_right
      expect(@dir.face).to eq('E')
    end
  end

  describe 'move forward' do
    it 'moving in current direction' do
      prev_y_value = @dir.y_value
      @dir.move_forward
      expect(@dir.y_value - prev_y_value).to eq(1)
    end

    it 'move only in present direction or axis' do
      prev_x_value = @dir.x_value
      @dir.move_forward
      expect(@dir.x_value - prev_x_value).to eq(0)
    end
  end
end
