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
end
