# frozen_string_literal: true

require_relative '../lib/board'
# a class for all chess game related operations
class Game
  attr_accessor :board, :current_player

  def initialize
    @board = Board.new
    @current_player = 0
    @rows = { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }
  end
end
