# frozen_string_literal: true

# a class for all pawn related operation
class Pawn
  attr_accessor :piece, :type

  def initialize(type)
    @piece = type.zero? ? "\u2659" : "\u265F"
    @type = type
  end
end
