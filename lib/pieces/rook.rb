# frozen_string_literal: true

# a class for all rook related operations
class Rook
  attr_accessor :piece, :type

  def initialize(type)
    @piece = type.zero? ? "\u2656" : "\u265C"
    @type = type
  end
end
