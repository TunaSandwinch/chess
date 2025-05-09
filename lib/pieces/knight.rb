# frozen_string_literal: true

# a class for all knight related operations
class Knight
  attr_accessor :piece, :type

  def initialize(color)
    @piece = color.zero? ? "\u2658" : "\u265E"
    @color = color
  end
end
