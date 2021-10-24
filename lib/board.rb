require "./lib/cell"

class Board
  attr_reader :cells
  def initialize
    @cells = {
               "A1" => Cell.new("A1"),
               "A2" => Cell.new("A2"),
               "A3" => Cell.new("A3"),
               "A4" => Cell.new("A4"),
               "B1" => Cell.new("B1"),
               "B2" => Cell.new("B2"),
               "B3" => Cell.new("B3"),
               "B4" => Cell.new("B4"),
               "C1" => Cell.new("C1"),
               "C2" => Cell.new("C2"),
               "C3" => Cell.new("C3"),
               "C4" => Cell.new("C4"),
               "D1" => Cell.new("D1"),
               "D2" => Cell.new("D2"),
               "D3" => Cell.new("D3"),
               "D4" => Cell.new("D4")}
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def validate_length(ship, coordinates)
    if ship.length == coordinates.length
      true
    else
      false
    end
  end

  def vertical_letters(coordinates)
    coordinates.map do |coordinate|
      coordinate.split('')
    end.map do |letter|
      letter.first()
    end.uniq.length
  end

  def horizontal_numbers(coordinates)
    coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |number|
      number.last()
    end.uniq.length
  end

  def vertical_letters_ascending?(coordinates)
    a = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |letter|
      letter.first()
    end.uniq.sort
    b = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |letter|
      letter.first()
    end
    if a == b
      true
    else
      false
    end
  end

  def horizontal_numbers_ascending?(coordinates)
    a = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |number|
      number.last()
    end.uniq.sort
    b = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |number|
      number.last()
    end
    if a == b
      true
    else
      false
    end
  end

  def consecutive_letters(coordinates)
    a = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |letter|
      letter.first()
    end
    if a.length == 2
      if a[1].ord - a[0].ord == 1
        true
      else
        false
      end
    elsif a.length == 3
      if a[2].ord - a[0].ord == 2
        true
      else
        false
      end
    end
  end

  def consecutive_numbers(coordinates)
    a = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |number|
      number.last()
    end
    if a.length == 2
      if a[1].to_i - a[0].to_i == 1
        true
      else
        false
      end
    elsif a.length == 3
      if a[2].to_i - a[0].to_i == 2
        true
      else
        false
      end
    end
  end


  def valid_placement?(ship, coordinates)
    if coordinates.any? {|coordinate|}
      false
    elsif validate_length(ship, coordinates) == true
      if vertical_letters_ascending?(coordinates) == false && horizontal_numbers_ascending?(coordinates) == false
        false
      elsif consecutive_letters(coordinates) || consecutive_numbers(coordinates) == true
        if consecutive_letters(coordinates) == true  && consecutive_numbers(coordinates) == false
          if vertical_letters(coordinates) == 1 || horizontal_numbers(coordinates) == 1
            if vertical_letters_ascending?(coordinates) == true
              true
            else
              false
            end
          end
        elsif consecutive_letters(coordinates) == false  && consecutive_numbers(coordinates) == true
          if vertical_letters(coordinates) == 1 || horizontal_numbers(coordinates) == 1
            if horizontal_numbers_ascending?(coordinates) == true
              true
            else
              false
            end
          end
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def place_ship(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(optional_arg = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(optional_arg)} #{@cells["A2"].render(optional_arg)} #{@cells["A3"].render(optional_arg)} #{@cells["A4"].render(optional_arg)} \n" +
    "B #{@cells["B1"].render(optional_arg)} #{@cells["B2"].render(optional_arg)} #{@cells["B3"].render(optional_arg)} #{@cells["B4"].render(optional_arg)} \n" +
    "C #{@cells["C1"].render(optional_arg)} #{@cells["C2"].render(optional_arg)} #{@cells["C3"].render(optional_arg)} #{@cells["C4"].render(optional_arg)} \n" +
    "D #{@cells["D1"].render(optional_arg)} #{@cells["D2"].render(optional_arg)} #{@cells["D3"].render(optional_arg)} #{@cells["D4"].render(optional_arg)} \n"

  end
end
