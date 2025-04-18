# frozen_string_literal: true

require_relative 'pieces/pawn'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
# a class for all board related operations
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '  ') }
    setup_board
  end

  def setup_board
    setup_white_pieces
    setup_black_pieces
  end

  def setup_white_pieces
    pawns = Array.new(8) { Pawn.new(0) }
    officials = [Rook.new(0), Knight.new(0), Bishop.new(0), Queen.new(0),
                 King.new(0, { row: 7, column: 4 }),
                 Bishop.new(0),
                 Knight.new(0),
                 Rook.new(0)]
    grid[6] = pawns
    grid[7] = officials
  end

  def setup_black_pieces
    pawns = Array.new(8) { Pawn.new(1) }
    officials = [Rook.new(1), Knight.new(1), Bishop.new(1), Queen.new(1),
                 King.new(1, { row: 0, column: 4 }),
                 Bishop.new(1),
                 Knight.new(1),
                 Rook.new(1)]
    grid[1] = pawns
    grid[0] = officials
  end

  def display
    white_bg = "\e[47m"  # white background
    black_bg = "\e[100m" # dark gray background
    reset    = "\e[0m"

    puts '    a  b  c  d  e  f  g  h'
    grid.each_with_index do |row, i|
      print " #{8 - i} "
      row.each_with_index do |cell, j|
        background = (i + j).even? ? white_bg : black_bg
        content = cell.respond_to?(:piece) ? cell.piece : ' '
        print "#{background} #{content} #{reset}"
      end
      puts " #{8 - i}"
    end
    puts '    a  b  c  d  e  f  g  h'
  end
end

Board.new.display
