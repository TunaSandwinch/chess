# frozen_string_literal: true

require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
# a class for all king related operations
class King
  attr_accessor :piece, :color, :current_position

  def initialize(color, initial_position)
    @piece = color.zero? ? "\u2654" : "\u265A"
    @color = color
    @current_position = initial_position
    @rook = Rook.new(color)
    @bishop = Bishop.new(color)
    @knight = Knight.new(color)
  end

  def inrange_moves
    increments = [[-1, 0], [0, 1], [1, 0], [0, -1], [-1, 1], [1, 1], [1, -1], [-1, -1]]
    moves = []
    increments.each do |row_step, column_step|
      row = current_position[:row] + row_step
      column = current_position[:column] + column_step
      moves << [row, column] if row.between?(0, 7) && column.between?(0, 7)
    end
    moves
  end

  def possible_moves(board)
    inrange_moves.select do |row, column|
      tile = board.grid[row][column]
      tile == ' ' || tile.color != color
    end
  end
end
# do an in range moves method and then possible moves method then do a check? method
