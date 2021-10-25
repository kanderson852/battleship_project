require "rspec"
require "./lib/game"

describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it 'has a ships sunk count' do
    game = Game.new
    expect(game.player_ships_sunk).to eq(0)
    expect(game.computer_ships_sunk).to eq(0)
  end
end
