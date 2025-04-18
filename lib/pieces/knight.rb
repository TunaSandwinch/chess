# frozen_string_literal: true

# a class for all knight related operations
class Knight
  attr_accessor :piece, :type

  def initialize(type)
    @piece = type.zero? ? "\u2658" : "\u265E"
    @type = type
  end
end
