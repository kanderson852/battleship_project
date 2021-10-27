require "rspec"
require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
require "./lib/game"

describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it 'attributes' do
    game = Game.new
    expect(game.computer).to be_an_instance_of(Player)
    expect(game.user).to be_an_instance_of(Player)
  end

  it "#valid_fire" do
    game = Game.new
    expect(game.valid_fire?("B3")).to eq(true)
    expect(game.valid_fire?("Z9")).to eq(false)
  end
end
