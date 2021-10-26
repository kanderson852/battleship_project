require './lib/board'
require "./lib/ship"
require "./lib/cell"
class Player
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def random_placer_cruiser
    @board.cells.keys.to_a.sample(3)
  end

  def random_placer_submarine
    @board.cells.keys.to_a.sample(2)
  end

  def computer_place_ships
    computer_cruiser = Ship.new("Cruiser", 3)
    until @board.valid_placement?(computer_cruiser, coordinates = random_placer_cruiser) == true do
      random_placer_cruiser
    end
    @board.place_ship(computer_cruiser, coordinates)
    computer_submarine = Ship.new("Submarine", 2)
    until @board.valid_placement?(computer_submarine, coordinates = random_placer_submarine) == true do
      random_placer_submarine
    end
    @board.place_ship(computer_submarine, coordinates)
    @board.render(true)
  end

  def user_place_ships
    user_cruiser = Ship.new("Cruiser", 3)
    user_submarine = Ship.new("Submarine", 2)
    coordinates = []
    until @board.valid_placement?(user_cruiser, coordinates) == true do
      coordinates = gets.chomp.upcase.split(' ')
      if @board.valid_placement?(user_cruiser, coordinates) == false
        puts "Those are invalid coordinates. Please try again:"
      end
    end
    @board.place_ship(user_cruiser, coordinates)
    puts "Then enter the squares for the Submarine (2 spaces):"
    until @board.valid_placement?(user_submarine, coordinates) == true do

      coordinates = gets.chomp.upcase.split(' ')
      if @board.valid_placement?(user_submarine, coordinates) == false
        puts "Those are invalid coordinates. Please try again:"
      end
    end
    @board.place_ship(user_submarine, coordinates)
    @board.render(true)
  end
end
