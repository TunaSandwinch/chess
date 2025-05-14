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

  def available_moves(position, board)
    increments = [[-1, 0], [1, 0], [0, 1], [0, -1]]
    valid_moves = []
    increments.each { |increment| valid_moves + moves(increment, position, board) }
    valid_moves
  end
end
