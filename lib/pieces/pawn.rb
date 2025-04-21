# frozen_string_literal: true

# a class for all pawn related operation
class Pawn
  attr_accessor :piece, :type

  def initialize(color)
    @piece = color.zero? ? "\u2659" : "\u265F"
    @color = color
    @valid_moves = []
  end

  def capture_move(position)
    row = position[:row]
    column = position[:column]
    increment = color.zero? ? -1 : 1

    [
      [row + increment, column - 1],
      [row + increment, column + 1]
    ]
  end
  # refactor code so that capture and move is different
end
