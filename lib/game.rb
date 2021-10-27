require './lib/board'
require "./lib/ship"
require "./lib/cell"
require "./lib/player"

class Game
  attr_reader :computer,
              :user,
              :player_ships_sunk,
              :computer_ships_sunk

  def initialize
    @computer = Player.new
    @user = Player.new

  end

  def welcome_message
    puts  "Welcome to BATTLESHIP"
    puts  "Enter p to play. Enter q to quit."
  end

  def game_rules
    @computer.computer_place_ships
    puts"I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    sleep(1.0)
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "#{@user.board.render(true)}"
    puts "Enter the squares for the Cruiser (3 spaces):"
    @user.user_place_ships
    
  end

  def user_input
    gets.chomp
  end

  def start_game
    puts welcome_message
    if user_input.downcase =="p"
      puts game_rules
    else user_input.downcase == "q"
      puts "Goodbye"
    end
  end

  def display_boards
    sleep(1.5)
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render(true)
    sleep(1.5)
    puts "==============PLAYER BOARD=============="
    puts @user.board.render(true)
    sleep(1.5)

  end

  def valid_fire?(coordinate)
    computer.board.cells.keys.include?(coordinate)
  end

  def computer_fired(coordinate = user.board.cells.keys.sample)
    if valid_fire?(coordinate) == true
    loop do
        if user.board.cells[coordinate].fired_upon? == false && user.board.cells[coordinate].is_empty == true
          user.board.cells[coordinate].fire_upon
          user.board.cells[coordinate].render(true) == "M"
          puts "My shot on #{coordinate} was a miss"
        elsif user.board.cells[coordinate].fired_upon? == false && user.board.cells[coordinate].is_empty == false
          user.board.cells[coordinate].fire_upon
          user.board.cells[coordinate].render(true) == "H"
          puts "My shot on #{coordinate} was a hit"
        elsif user.board.cells[coordinate].fired_upon? == false && user.board.cells[coordinate].is_empty == false && user.board.cells[coordinate].ship.sunk? == true
          user.board.cells[coordinate].fire_upon
          user.board.cells[coordinate].render(true) == "X"
          puts "My shot on #{coordinate} was a hit and I sunk your ship"
        end
        display_boards
        break
      end
    end
  end

  def user_fired(coordinate = user_input.upcase)
    loop do
      if valid_fire?(coordinate) == true
        if computer.board.cells[coordinate].fired_upon? == false
            @computer.board.cells[coordinate].fire_upon
          if computer.board.cells[coordinate].is_empty == true
            computer.board.cells[coordinate].render(true) == "M"
            puts "Your shot on #{coordinate} was a miss"
          elsif computer.board.cells[coordinate].fired_upon? == false && computer.board.cells[coordinate].is_empty == false
            computer.board.cells[coordinate].render(true) == "H"
            puts "Your shot on #{coordinate} was a hit"
          elsif computer.board.cells[coordinate].fired_upon? == false && computer.board.cells[coordinate].is_empty == false && computer.board.cells[coordinate].ship.sunk? == true
            computer.board.cells[coordinate].render(true) == "X"
            puts "Your shot on #{coordinate} was a hit and you sunk my BATTLESHIP!"
          end
        end
      elsif valid_fire?(coordinate) == false
        puts "Please enter a valid coordinate:"
      end
      display_boards
      break
    end
  end

  def game_over?
    (computer.computer_cruiser.sunk? == true && computer.computer_submarine.sunk? == true) || (user.user_cruiser.sunk? == true && user.user_submarine.sunk? == true)
  end

  def winner
    puts "Game over!"
    if computer.computer_cruiser.sunk? == true && computer.computer_submarine.sunk? == true
      puts "You won!"
    elsif user.user_cruiser.sunk? == true && user.user_submarine.sunk? == true
      puts "I won!"
    end
  end

  def start_turn
    loop do
      puts "Enter the coordinate for your shot:"
      user_fired
      computer_fired
      break if game_over? == true
    end
    winner
    load "./battleship_runner.rb"
  end
end
