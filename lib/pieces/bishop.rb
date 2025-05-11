# frozen_string_literal: true

# a class for all bishop related operations
class Bishop
  attr_accessor :piece, :color

  def initialize(color)
    @piece = color.zero? ? "\u2657" : "\u265D"
    @color = color
  end
end
