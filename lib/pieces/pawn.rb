# frozen_string_literal: true

# a class for all pawn related operation
class Pawn
  attr_accessor :piece, :type

  def initialize(color)
    @piece = color.zero? ? "\u2659" : "\u265F"
    @color = color
    @valid_moves = []
  end

  def white_moves(position)
    row = position[:row]
    column = position[:column]
    [
      [row - 1, column],
      [row - 1, column - 1],
      [row - 1, column + 1]
    ]
  end

  def black_moves(position)
    row = position[:row]
    column = position[:column]
    [
      [row + 1, column],
      [row + 1, column - 1],
      [row + 1, column + 1]
    ]
  end
end
