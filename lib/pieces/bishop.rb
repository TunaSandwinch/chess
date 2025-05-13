# frozen_string_literal: true

# a class for all bishop related operations
class Bishop
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2657" : "\u265D"
    @color = color
  end

  def moves(increment, position, board)
    valid_moves = []
    row, column = position.values_at(:row, :column)
    while row.between?(1, 6) && column.between?(1, 6)
      row += increment[:row]
      column += increment[:column]
      tile = board.grid[row][column]
      valid_moves << [row, column]
      return (tile.color == color ? valid_moves.tap(&:pop) : valid_moves) if tile.respond_to?(:color)
    end
    valid_moves
  end
end
