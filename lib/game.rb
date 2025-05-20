# frozen_string_literal: true

require_relative '../lib/board'
# a class for all chess game related operations
class Game
  attr_accessor :board, :current_player_color, :columns

  def initialize
    @board = Board.new
    @current_player_color = 0
    @columns = { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }
  end

  def valid_input?(move)
    return true if move.match?(/\A[a-h][1-8]\z/)

    puts 'invalid input'
    false
  end

  def piece_location(move)
    { row: move[1].to_i - 1, column: columns[move[0].to_sym] }
  end

  def valid_piece?(move)
    tile = board.grid[move[:row]][move[:column]]
    if tile == ' '
      puts 'there is no piece on that tile!'
      return false
    end

    return true if tile.color == current_player_color

    puts 'that is not your piece!'
    false
  end

  def piece_has_moves?(move)
    if board.grid[move[:row]][move[:column]].available_moves(move, board).empty?
      puts 'this piece has no available moves!'
      return false
    end

    true
  end

  def piece_to_move
    loop do
      puts 'choose a piece to move ex. e4, e5 etc:'
      player_input = gets.chomp.downcase
      next unless valid_input?(player_input)

      player_piece = piece_location(player_input)
      p player_piece
      return player_piece if valid_piece?(player_piece) && piece_has_moves?(player_piece)
    end
  end
end

# game = Game.new
# game.board.display
# game.piece_to_move
