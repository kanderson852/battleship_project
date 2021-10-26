require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
require "./lib/turn"
require "rspec"

describe Turn do
  it 'exists' do
    turn = Turn.new
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'attributes' do
    turn = Turn.new
    expect(turn.computer).to be_an_instance_of(Player)
    expect(turn.user).to be_an_instance_of(Player)
    expect(turn.computer_sunk).to eq(0)
    expect(turn.user_sunk).to eq(0)
  end

  it "#valid_fire" do
    turn = Turn.new
    expect(turn.valid_fire?("A1")).to eq(true)
    expect(turn.valid_fire?("Z1")).to eq(false)
  end

  it 'computer fires' do
    turn = Turn.new
    expect(turn.computer_fired).to eq('x')
  end
end
