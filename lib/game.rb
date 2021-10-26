require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"
require "./lib/turn"

class Game
  attr_reader :computer,
              :user,
              :player_ships_sunk,
              :computer_ships_sunk

  def initialize(computer, user)
    @computer = computer
    @user = user
    @player_ships_sunk = 0
    @computer_ships_sunk = 0
  end

  def welcome_message
    puts  "Welcome to BATTLESHIP"
    puts  "Enter p to play. Enter q to quit."
  end

  def game_rules
    @computer.computer_place_ships
    puts"I have laid out my ships on the grid."
    "You now need to lay out your two ships."
    "The Cruiser is three units long and the Submarine is two units long."
    puts "#{@user.board.render(true)}"
    puts "Enter the squares for the Cruiser (3 spaces):"
  
    @user.user_place_ships

  end

  def user_input
    gets.chomp
  end

  def start_game
    puts welcome_message
    if user_input =="p"
      puts game_rules
    else user_input == "q"
      puts "Goodbye"
    end
  end
end
