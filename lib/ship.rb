class Ship
  attr_reader :name, :length, :health
  def initialize(name, length, health = length)
    @name = name
    @length = length
    @health = health
  end

  def sunk?
    if @health >= 1
      false
    elsif @health < 1
       true
    end
  end

  def hit
    @health -= 1
  end
end
