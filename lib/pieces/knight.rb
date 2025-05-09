# frozen_string_literal: true

# a class for all knight related operations
class Knight
  attr_accessor :piece, :type

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
end
