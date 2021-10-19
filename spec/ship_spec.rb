require './lib/ship'
describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_a(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
  end

  it 'has health equal to its length by default' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  it 'is not sunk to start with' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'loses health when hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  it 'loses another health when hit again' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to eq(false)
  end

  it 'sinks at zero health' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to eq(true)
  end
end
