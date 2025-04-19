# frozen_string_literal: true

# a class for all pawn related operation
class Pawn
  attr_accessor :piece, :type

  def initialize(type)
    @piece = type.zero? ? "\u2659" : "\u265F"
    @type = type
    @valid_moves = []
  end

  def white_moves(position)
    [
      [position[:row] - 1, position[:column]],
      [position[:row] - 1, position[:column] - 1],
      [position[:row] - 1, position[:column] + 3]
    ]
  end

  def black_moves(position)
    [
      [position[:row] + 1, position[:column]],
      [position[:row] + 1, position[:column] - 1],
      [position[:row] + 1, position[:column] + 1]
    ]
  end
end
