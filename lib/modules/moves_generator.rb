# frozen_string_literal: true

# a module for validating the set of moves for each piece
module MovesGenerator
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
