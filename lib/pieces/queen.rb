# frozen_string_literal: true

require_relative '../pieces/bishop'
require_relative '../pieces/rook'
# a class for all queen related operations
class Queen
  attr_accessor :piece, :type

  def initialize(color)
    @piece = color.zero? ? "\u2655" : "\u265B"
    @color = color
    @bishop = Bishop.new(color)
    @rook = Rook.new(color)
  end
end
