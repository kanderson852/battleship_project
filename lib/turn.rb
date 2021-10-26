require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
class Turn
  attr_reader :computer,
              :user,
              :computer_sunk,
              :user_sunk
  def initialize
    @computer = Player.new
    @user = Player.new

    @computer_sunk = 0
    @user_sunk = 0
  end

  def user_render
    @user_board.render(true)
  end

  def computer_render
    @computer_board.render
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    computer_render
    puts "==============PLAYER BOARD=============="
    user_render
  end

  def user_input
    gets.chomp
  end

  def valid_fire?(coordinate)
    computer.computer_board.cells.keys.include?(coordinate)
  end

  def user_fired(coordinate)
    loop do
      if user_input.valid_fire? == false
        puts "Please enter a valid coordinate:"
      else
        if @fired == true && @is_empty == true
          "M"
        elsif @fired == true && @is_empty == false && ship.sunk? == true
          "X"
        elsif @fired == true && @is_empty == false
          "H"
        end
      end
    end
  end


  # def computer_fired
  #
  # end
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
