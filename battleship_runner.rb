require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
require "./lib/game"

game = Game.new

game.start_game
game.start_turn
