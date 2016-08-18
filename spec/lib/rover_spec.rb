require 'spec_helper'

RSpec.shared_examples "rover movement" do |plateu, start_pos, end_pos, moves|
  context "rover starting at #{start_pos.x} #{start_pos.y} #{start_pos.direction}" do
    subject {Rover.new(plateu, start_pos)}
    context "movement stream #{moves}" do
      it 'should finish on position #{end_pos.x} #{end_pos.y} #{end_pos.direction}' do
        subject.run(moves)
        expect(subject.position.x).to eq(end_pos.x)
        expect(subject.position.y).to eq(end_pos.y)
        expect(subject.position.direction).to eq(end_pos.direction)
      end
    end
  end
end

describe Rover do

  before do
    @plateu = Plateu.new(5, 5)
  end
  it_should_behave_like 'rover movement',Plateu.new(5, 5), Position.new(1, 2, 'N'),
    Position.new(1, 3, 'N'), 'LMLMLMLMM'
  it_should_behave_like 'rover movement',Plateu.new(5, 5), Position.new(3, 3, 'E'),
    Position.new(5, 1, 'E'), 'MMRMMRMRRM'

end
