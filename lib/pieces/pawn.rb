# frozen_string_literal: true

# a class for all pawn related operation
class Pawn
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2659" : "\u265F"
    @color = color
    @valid_moves = []
    @board = 'REMOVE THIS AFTER TESTING'
  end

  def capture_moves(position)
    row = position[:row]
    column = position[:column]
    increment = color.zero? ? -1 : 1

    [
      [row + increment, column - 1],
      [row + increment, column + 1]
    ]
  end

  def valid_capture_moves(position)
    capture_moves(position).select { |row, column| row.between?(0, 7) && column.between?(0, 7) }
  end
end
