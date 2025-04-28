# frozen_string_literal: true

# a class for all king related operations
class King
  attr_accessor :piece, :color, :current_position

  def initialize(color, initial_position)
    @piece = color.zero? ? "\u2654" : "\u265A"
    @color = color
    @current_position = initial_position
  end
end
