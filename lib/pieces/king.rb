# frozen_string_literal: true

# a class for all king related operations
class King
  attr_accessor :piece, :type, :current_position

  def initialize(type, initial_position)
    @piece = type.zero? ? "\u2654" : "\u265A"
    @type = type
    @current_position = initial_position
  end
end
