# spec/mars_grid_spec.rb

require_relative 'spec_helper'

describe Grid do
  before :each do
    @grid = Grid.new(5, 5)
  end

  describe '#new' do
    it 'returns Grid object' do
      expect(@grid).to be_a Grid
    end

    it 'should not return nil' do
      expect(@grid).not_to be_nil
    end
  end

  describe 'valid?' do
    it 'valid coordinates of rover should be returned' do
      rover = Rover.new(0, 1, 1, 'N')
      expect(@grid.valid?(rover.dir.x_value, rover.dir.y_value, rover.dir.face))
        .to be_truthy
    end

    it 'invalid coordinates of rover should be returned' do
      rover = Rover.new(0, 1, 6, 'N')
      expect(@grid.valid?(rover.dir.x_value, rover.dir.y_value, rover.dir.face))
        .to be_falsey
    end

    it 'invalid directions of rover should be returned' do
      rover = Rover.new(0, 1, 1, 'Q')
      expect(@grid.valid?(rover.dir.x_value, rover.dir.y_value, rover.dir.face))
        .to be_falsey
    end
  end
end
