class Game
  attr_reader :player_ships_sunk,
              :computer_ships_sunk
  def initialize
    @player_ships_sunk = 0
    @computer_ships_sunk = 0
  end

  def welcome_message
    puts  "Welcome to BATTLESHIP"
    puts  "Enter p to play. Enter q to quit."
  end

  def game_rules
    computer_place_ships
    puts"I have laid out my ships on the grid."
    "You now need to lay out your two ships."
    "The Cruiser is three units long and the Submarine is two units long."
    puts "#{@user_board.render(true)}"
    "Enter the squares for the Cruiser (3 spaces):"
  end

  def start_game
    puts welcome_message
    if user_input =="p"
      puts game_rules
    else user_input == "q"
      puts "Goodbye"
    end
  end

  def 



end
