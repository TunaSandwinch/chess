# frozen_string_literal: true

# a class for all queen related operations
class Queen
  attr_accessor :piece, :type

  def initialize(type)
    @piece = type.zero? ? "\u2655" : "\u265B"
    @type = type
  end
end
