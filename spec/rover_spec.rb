# spec/mars_rover_spec.rb

require_relative 'spec_helper'

describe Rover do
  before :each do
    @rover = Rover.new(0, 1, 1, 'N')
  end

  describe 'new object' do
    it 'returns new rover object' do
      expect(@rover).to be_a Rover
    end

    it 'not to be nil' do
      expect(@rover).not_to be_nil
    end
  end

  describe 'move forward' do
    it 'move forward direction' do
      expect(@rover.dir).to receive(:move_forward)
      @rover.move
    end
  end

  describe 'rotate right' do
    it 'turn towards right direction' do
      expect(@rover.dir).to receive(:turn_right)
      @rover.rotate_right
    end
  end

  describe 'rotote left' do
    it 'turn towards left direction' do
      expect(@rover.dir).to receive(:turn_left)
      @rover.rotate_left
    end
  end
end
