require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/turn"
require "rspec"

describe Turn do
  it 'exists' do
    turn = Turn.new
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'attributes' do
    turn = Turn.new
    expect(turn.computer_board).to be_an_instance_of(Board)
    expect(turn.user_board).to be_an_instance_of(Board)
    expect(turn.computer_ships).to eq([])
    expect(turn.user_ships).to eq([])
  end
end
