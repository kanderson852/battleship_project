require './lib/board'
require "./lib/ship"
require "./lib/cell"
require ".lib/player"
class Turn
  attr_reader :computer_ships, :user_ships
  def initialize()

    @computer_ships =
    @user_ships =
  end

  def user_input
    gets.chomp
  end


  # Computer can place ships randomly in valid locations
  
# User can enter valid sequences to place both ships
# method user_place_ships
# Entering invalid ship placements prompts user to enter valid placements
# Turn:
# User board is displayed showing hits, misses, sunken ships, and ships
  def user_render
    @user_board.render(true)
  end

  def computer_render
    @computer_board.render
  end
# Computer board is displayed showing hits, misses, and sunken ships
# def computer_render
# Computer chooses a random shot
  def shoot(coordinate)
  end

  def user_play

  end
end


# def computer_take_turn
#   def shoot
# Computer does not fire on the same spot twice
#   use valid_placement?
# User can choose a valid coordinate to fire on
#   use valid_placement?
# Entering invalid coordinate prompts user to enter valid coordinate
# Both computer and player shots are reported as a hit, sink, or miss
#   def render_shots
# User is informed when they have already fired on a coordinate
# Board is updated after a turn
# def board_update
#
# End Game:
# def endgame
# Game ends when all the user’s ships are sunk
# Game ends when all the computer’s ships are sunk
# Game reports who won
# Game returns user back to the Main Menu
turn = Turn.new
# turn.user_place_ships
turn.start_game
