# frozen_string_literal: true

require_relative '../modules/moves_validator'
# a class for all rook related operations
class Rook
  include MovesValidator
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2656" : "\u265C"
    @color = color
  end

  def upward_moves(position, board)
    row = position[:row]
    column = position[:column]
    moves = []
    until row.zero?
      row -= 1
      moves << [row, column]
      break unless continue_step?({ row: row, column: column }, board)
    end
    moves
  end

  def downward_moves(position, board)
    row = position[:row]
    column = position[:column]
    moves = []
    until row == 7
      row += 1
      moves << [row, column]
      break unless continue_step?({ row: row, column: column }, board)
    end
    moves
  end

  def right_moves(position, board)
    row = position[:row]
    column = position[:column]
    moves = []
    until column == 7
      column += 1
      moves << [row, column]
      break unless continue_step?({ row: row, column: column }, board)
    end
    moves
  end

  def left_moves(position, board)
    row = position[:row]
    column = position[:column]
    moves = []
    until column.zero?
      column -= 1
      moves << [row, column]
      break unless continue_step?({ row: row, column: column }, board)
    end
    moves
  end

  def continue_step?(position, board)
    tile = board.grid[position[:row]][position[:column]]
    return false unless tile == ' ' || tile.color == color

    true
  end

  def available_moves(position, board)
    left_moves = remove_invalid_last_move(left_moves(position, board), board)
    right_moves = remove_invalid_last_move(right_moves(position, board), board)
    upward_moves = remove_invalid_last_move(upward_moves(position, board), board)
    downward_moves = remove_invalid_last_move(downward_moves(position, board), board)

    left_moves + right_moves + upward_moves + downward_moves
  end
end
