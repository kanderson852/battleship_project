require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
require "./lib/game"

user = Player.new
computer = Player.new
game = Game.new(computer, user)

game.start_game
game.start_turn
