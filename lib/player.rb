class Player
  attr_reader :computer_board, :user_board
  def initialize()
    @computer_board = Board.new
    @user_board = Board.new
  end

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
end

#   def user_place_ships
#     cruiser = Ship.new("Cruiser", 3)
#     submarine = Ship.new("Submarine", 2)
#     until @user_board.valid_placement?(submarine, coordinates = gets.chomp) == true do
#       coordinates = gets.chomp
#     end
#     @user_board.place_ship(cruiser, coordinates)
#   end
# end
