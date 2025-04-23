# frozen_string_literal: true

# a class for all rook related operations
class Rook
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2656" : "\u265C"
    @color = color
  end
end
