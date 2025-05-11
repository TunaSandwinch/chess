# frozen_string_literal: true

# a class for all knight related operations
class Knight
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2658" : "\u265E"
    @color = color
  end

  def possible_moves(position)
    addends = [[-2, -1], [-2, 1], [-1, 2], [1, 2], [-1, -2], [1, -2], [2, -1], [2, 1]]
    moves = []
    addends.each do |addend1, addend2|
      row = position[:row] + addend1
      column = position[:column] + addend2
      moves << [row, column] if row.between?(0, 7) && column.between?(0, 7)
    end
    moves
  end

  def available_moves(position, board)
    possible_moves(position).select do |row, column|
      piece = board.grid[row][column]
      piece == ' ' || piece.color != color
    end
  end
end
