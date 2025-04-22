# frozen_string_literal: true

# a class for all pawn related operation
class Pawn
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2659" : "\u265F"
    @color = color
    @valid_moves = ''
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

  def inrange_capture_moves(position)
    capture_moves(position).select { |row, column| row.between?(0, 7) && column.between?(0, 7) }
  end

  def valid_capture_moves(position, board)
    inrange_capture_moves(position).reject do |row, column|
      board.grid[row][column] == ' ' || board.grid[row][column].color == color
    end
  end

  def forward_move(position, board)
    row = position[:row]
    column = position[:column]
    increment = color.zero? ? -1 : 1

    return [[row + increment, column]] if board.grid[row + increment][column] == ' '

    []
  end
end
