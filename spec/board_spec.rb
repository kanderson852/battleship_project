require './lib/board'
require "./lib/ship"
require "./lib/cell"

RSpec.describe Board do
  it "exists" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it "has a cells hash" do
    board = Board.new
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")

    expect(board.cells).to be_a(Hash)
  end

  it "cells" do
    board = Board.new
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    expect(board.cells).to match(hash_including("A1","A2","A3","A4","B1","B2","B3","B4","C1","C2","C3","C4","D1","D2","D3","D4"))
  end

  it 'validates coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  xit 'validates placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq (false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end
  xit 'validates placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
  end

  it 'checks vertical placement' do
    board = Board.new
    expect(board.vertical(["A1","A2","A3"])).to eq(1)
    expect(board.vertical(["A1","B2","C3"])).to eq(3)
  end

  it 'checks horizontal placement' do
    board = Board.new
    expect(board.horizontal(["A1","A2","A3"])).to eq(3)
    expect(board.horizontal(["A1","B1","C1"])).to eq(1)
  end
end
