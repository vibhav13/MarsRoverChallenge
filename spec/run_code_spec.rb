# spec/StartRover_spec.rb

require_relative 'spec_helper'

describe StartRover do
  before :all do
    @StartRover = StartRover.new
  end

  describe 'new object' do
    it 'returns StartRover class object' do
      expect(@StartRover).to be_a StartRover
    end

    it 'not to be nil' do
      expect(@StartRover).not_to be_nil
    end
  end

  describe 'check for coordinates validity' do
    it 'returns true for valid coordinates' do
      expect(@StartRover.check_grid_coordinates?(5, 5)).to be_truthy
    end

    it 'returns false for valid coordinates' do
      expect(@StartRover.check_grid_coordinates?('a', 5)).to be_falsey
    end
  end

  describe 'input coordinates' do
    it 'should take inputs' do
      allow(@StartRover).to receive(:gets).and_return('5 5')
      @StartRover.input_grid_coordinates
      expect(@StartRover.grid.top_right_x).to eq(5)
      expect(@StartRover.grid.top_right_y).to eq(5)
    end

    it 'gives Error on invalid input' do
      allow(@StartRover).to receive(:gets).and_return('a 5')
      expect { @StartRover.input_grid_coordinates }.to raise_error(ArgumentError)
    end
  end

  describe 'send operations to rover' do
    it 'should process valid instruction' do
      allow(STDOUT).to receive(:puts)
      @StartRover.rover = Rover.new(0, 1, 1, 'N')
      expect(@StartRover.send_operations_to_rover('L')).not_to be_falsey
    end

    it 'should return false on invalid instruction' do
      allow(STDOUT).to receive(:puts)
      @StartRover.rover = Rover.new(0, 1, 1, 'N')
      expect(@StartRover.send_operations_to_rover('Q')).to be_falsey
    end
  end
end
