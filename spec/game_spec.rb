require "rspec"
require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
require "./lib/game"

describe Game do
  it 'exists' do
    user = Player.new
    computer = Player.new
    game = Game.new(computer, user)
    expect(game).to be_an_instance_of(Game)
  end

  it 'attributes' do
    user = Player.new
    computer = Player.new
    game = Game.new(computer, user)
    expect(game.computer).to eq(computer)
    expect(game.user).to eq(user)

  end

  it 'has a ships sunk count' do
    user = Player.new
    computer = Player.new
    game = Game.new(computer, user)

    expect(game.player_ships_sunk).to eq(0)
    expect(game.computer_ships_sunk).to eq(0)
  end
end
