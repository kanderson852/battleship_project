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
    cruiser = Ship.new("Cruiser", 3)
    until @board.valid_placement?(cruiser, coordinates = random_placer_cruiser) == true do
      random_placer_cruiser
    end
    @board.place_ship(cruiser, coordinates)
    submarine = Ship.new("Submarine", 2)
    until @board.valid_placement?(submarine, coordinates = random_placer_submarine) == true do
      random_placer_submarine
    end
    @board.place_ship(submarine, coordinates)
    @board.render(true)
  end

  def user_place_ships
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    coordinates = []
    until @board.valid_placement?(cruiser, coordinates) == true do
      coordinates = gets.chomp.split(' ')
      if @board.valid_placement?(cruiser, coordinates) == false
        puts "Those are invalid coordinates. Please try again:"
      end
    end
    @board.place_ship(cruiser, coordinates)
    until @board.valid_placement?(submarine, coordinates) == true do
      coordinates = gets.chomp.split(' ')
      if @board.valid_placement?(submarine, coordinates) == false
        puts "Those are invalid coordinates. Please try again:"
      end
    end
    @board.place_ship(submarine, coordinates)
    @board.render(true)
  end
end
