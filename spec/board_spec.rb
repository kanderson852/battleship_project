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

  # it "cells" do
  #   board = Board.new
  #   cell_1 = Cell.new("B4")
  #   cell_2 = Cell.new("C3")
  #   expect(board.cells).to eq()
  # end

  it 'validates coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'validates placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq (false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end
  it 'validates placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
end
