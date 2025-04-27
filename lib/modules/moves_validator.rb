# frozen_string_literal: true

# a module for validating the set of moves for each piece
module MovesValidator
  def validate_last_move(set_of_moves, board)
    row = set_of_moves.last[0]
    column = set_of_moves.last[1]

    return set_of_moves if board.grid[row][column] == ' '

    set_of_moves.pop if board.grid[row][column].color == color
    set_of_moves
  end
end
