# frozen_string_literal: true

# a class for all rook related operations
class Rook
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2656" : "\u265C"
    @color = color
  end

  def upward_moves(position)
    row = position[:row]
    column = position[:column]
    moves = []
    until row.zero?
      row -= 1
      moves << [row, column]
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
end
