require "rspec"
require "./lib/ship"
require "./lib/cell"

describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_an_instance_of(Cell)
  end

  xit 'attributes' do
    cell = Cell.new("B4")
    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  xit 'empty?' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  xit 'knows when its fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)

    cell.fired_upon

    expect(cell.ship.health).to eq(2)


    expect(cell.fired_upon?).to eq(true)
  end
end
