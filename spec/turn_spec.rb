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

  it 'computer places ships' do
    turn = Turn.new
    expect(turn.computer_place_ships).to eq(turn.computer_board.render(true))
  end

  it 'user places ships' do
    turn = Turn.new
    expect(turn.user_place_ships).to eq(turn.user_board.render(true))
  end
end
