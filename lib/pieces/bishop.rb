# frozen_string_literal: true

require_relative '../modules/moves_generator'
# a class for all bishop related operations
class Bishop
  attr_accessor :piece, :color

  include MovesGenerator
  def initialize(color)
    @piece = color.zero? ? "\u2657" : "\u265D"
    @color = color
  end

  def available_moves(position, board)
    increments = [[-1, 1], [1, -1], [-1, -1], [1, 1]]
    valid_moves = []
    increments.each { |increment| valid_moves += moves(increment, position, board) }
    valid_moves
  end
end
