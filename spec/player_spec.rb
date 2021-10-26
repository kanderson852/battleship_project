require "rspec"
require './lib/board'
require "./lib/ship"
require "./lib/cell"
require './lib/player'

describe Player do
  it 'exists' do
    player = Player.new
    expect(player).to be_an_instance_of(Player)
  end

  it 'attributes' do
    player = Player.new
    expect(player.board).to be_an_instance_of(Board)
  end

  it 'computer places ships' do
    player = Player.new
    expect(player.computer_place_ships).to eq(player.board.render(true))
  end
end
