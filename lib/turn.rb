require './lib/board'
require "./lib/ship"
require "./lib/cell"

class Turn
  attr_reader :computer_board, :user_board, :computer_ships, :user_ships
  def initialize()
    @computer_board = Board.new
    @user_board = Board.new
    @computer_ships = []
    @user_ships = []
  end

  def start_game
  end 

  # Computer can place ships randomly in valid locations
  def random_placer_cruiser
    @computer_board.cells.keys.to_a.sample(3)
  end

  def random_placer_submarine
    @computer_board.cells.keys.to_a.sample(2)
  end

  def computer_place_ships
    cruiser = Ship.new("Cruiser", 3)
    until @computer_board.valid_placement?(cruiser, coordinates = random_placer_cruiser) == true do
      random_placer_cruiser
    end
    @computer_board.place_ship(cruiser, coordinates)
    submarine = Ship.new("Submarine", 2)
    until @computer_board.valid_placement?(submarine, coordinates = random_placer_submarine) == true do
      random_placer_submarine
    end
    @computer_board.place_ship(submarine, coordinates)
    @computer_board.render(true)
  end

  def user_place_ships
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    until @user_board.valid_placement?(submarine, coordinates = gets.chomp) == true do
      coordinates = gets.chomp
    end
    @user_board.place_ship(cruiser, coordinates)
  end
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
turn.user_place_ships
