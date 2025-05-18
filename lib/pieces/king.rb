# frozen_string_literal: true

require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'pawn'
require_relative 'queen'
# a class for all king related operations
class King
  attr_accessor :piece, :color, :current_position

  include MovesGenerator
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
    moves = inrange_moves.select do |row, column|
      tile = board.grid[row][column]
      tile == ' ' || tile.color != color
    end
    moves.map { |row, column| { row: row, column: column } }
  end

  def last_tiles(set_of_moves)
    last_tiles = []
    set_of_moves.each do |tiles|
      last_tiles << { row: tiles.last[0], column: tiles.last[1] } unless tiles.empty?
    end
    last_tiles
  end

  def checked_diagonaly?(position, board)
    diagonal_moves = [moves([-1, 1], position, board),
                      moves([1, -1], position, board),
                      moves([-1, -1], position, board),
                      moves([1, 1], position, board)]
    last_tiles(diagonal_moves).each do |move|
      tile = board.grid[move[:row]][move[:column]]
      return true if tile.respond_to?(:color) && (tile.is_a?(Bishop) || tile.is_a?(Queen))
    end
    false
  end

  def checked_horizontaly?(position, board)
    horizontal_moves = [moves([-1, 0], position, board),
                        moves([1, 0], position, board),
                        moves([0, 1], position, board),
                        moves([0, -1], position, board)]
    last_tiles(horizontal_moves).each do |move|
      next if move.empty?

      tile = board.grid[move[:row]][move[:column]]
      return true if tile.respond_to?(:color) && (tile.is_a?(Rook) || tile.is_a?(Queen))
    end
    false
  end
end
