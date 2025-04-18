# frozen_string_literal: true

# a class for all bishop related operations
class Bishop
  attr_accessor :piece, :type

  def initialize(type)
    @piece = type.zero? ? "\u2657" : "\u265D"
    @type = type
  end
end
