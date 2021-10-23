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


  #valid placement needs to
  #array needs to be same length as ship
  def validate_length(ship, coordinates)
    if ship.length == coordinates.length
      true
    else
      false
    end
  end
  # Find a way to check numbers, and letters separately for all conditions after they are passed into our Validate Placement method as an array of coordinates

 ## checks for vertical placement
  def vertical_letters(coordinates)
    coordinates.map do |coordinate|
      coordinate.split('')
    end.map do |letter|
      letter.first()
    end.uniq.length
  end
 ## checks for horizontal placement
  def horizontal_numbers(coordinates)
    coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |number|
      number.last()
    end.uniq.length
  end

  #checks if letters are in ascending order
  def vertical_letters_ascending?(coordinates)
    a = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |letter|
      letter.first()
    end.sort
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
  #checks if numbers are ascending
  def horizontal_numbers_ascending?(coordinates)
    a = coordinates.map do |coordinates|
      coordinates.split('')
    end.map do |number|
      number.last()
    end.sort
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
    # while valid_lngth is true and cons is true
    # diaganol
    # one has to be equal to 1 both can't be
    if validate_length(ship, coordinates) == true
      if consecutive_letters(coordinates) || consecutive_numbers(coordinates) == true
        if consecutive_letters(coordinates) == true  && consecutive_numbers(coordinates) == false
          if vertical_letters(coordinates) == 1 || horizontal_numbers(coordinates) == 1
            true
            if vertical_letters_ascending?(coordinates) == true
              true
            else
              false
            end
          else vertical_letters(coordinates) == 1 && horizontal_numbers(coordinates) == 1
            false
          end
        elsif consecutive_letters(coordinates) == false  && consecutive_numbers(coordinates) == true
          if horizontal_numbers_ascending?(coordinates) == true
            true
          else
            false
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
end


# vertical and horizontal




  # Are numbers consecutive when ascending? if not, then FALSE.
  # When more than one letter is used, and its ascending, is it consecutive? if yes, AND there is only 1 number used, then TRUE.

  # When more than one letter is used, and its ascending, is it consecutive? if yes, AND there more than 1 number used, then FALSE.
  # If letters and numbers are both ascending, then FALSE because it would mean it was placed diagonally.
  # If letters are descending, then its FALSE
  # If numbers are descending then its FALSE
