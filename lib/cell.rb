class Cell
  attr_reader :coordinate,
              :ship,
              :is_empty,
              :fired
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @is_empty = true
    @fired = false
  end

  def empty?
    @is_empty
  end

  def place_ship(ship)
    @ship = ship
    @is_empty = false
  end

  def fired_upon?
    @fired
  end

  def fire_upon
    if empty? == false
      ship.hit
    end
    @fired = true
  end

  def render(optional_arg = false)
    if @fired == false && optional_arg == true
      "S"
    elsif @fired == false
      "."
    elsif @fired == true && @is_empty == true
      "M"
    elsif @fired == true && @is_empty == false && ship.sunk? == true
      "X"
    elsif @fired == true && @is_empty == false
      "H"
    end
  end
end
