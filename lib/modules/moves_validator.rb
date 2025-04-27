# frozen_string_literal: true

require_relative '../../lib/pieces/king'
# a module for validating the set of moves for each piece
module MovesValidator
  def remove_invalid_last_move(set_of_moves, board)
    last_move = board.grid[set_of_moves.last[0]][set_of_moves.last[1]]
    return set_of_moves if last_move == ' '

    set_of_moves.pop if last_move.color == color || last_move.instance_of?(King)
    set_of_moves
  end
end
