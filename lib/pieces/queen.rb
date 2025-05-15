# frozen_string_literal: true

require_relative '../pieces/bishop'
require_relative '../pieces/rook'
# a class for all queen related operations
class Queen
  attr_accessor :piece, :color, :bishop, :rook

  def initialize(color)
    @piece = color.zero? ? "\u2655" : "\u265B"
    @color = color
    @bishop = Bishop.new(color)
    @rook = Rook.new(color)
  end

  def available_moves(position, board)
    bishop.available_moves(position, board) + rook.available_moves(position, board)
  end
end
