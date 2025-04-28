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

  def downward_moves(position)
    row = position[:row]
    column = position[:column]
    moves = []
    until row == 7
      row += 1
      moves << [row, column]
    end
    moves
  end

  def right_moves(position)
    row = position[:row]
    column = position[:column]
    moves = []
    until column == 7
      column += 1
      moves << [row, column]
    end
    moves
  end

  def left_moves(position)
    row = position[:row]
    column = position[:column]
    moves = []
    until column.zero?
      column -= 1
      moves << [row, column]
    end
    moves
  end

  def continue_step?(position, board)
    tile = board.grid[position[:row]][position[:column]]
    return true if tile == ' '

    false
  end
end
