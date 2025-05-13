# frozen_string_literal: true

require_relative '../lib/pieces/bishop'

describe Bishop do # rubocop:disable Metrics/BlockLength
  subject('bishop_white') { described_class.new(0) }
  subject('bishop_black') { described_class.new(1) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }
  it 'returns the correct set of moves for right upward diagonal' do
    increment = { row: -1, column: 1 }
    initial_position = { row: 3, column: 4 }
    expected_set_of_moves = [[2, 5], [1, 6], [0, 7]]
    set_of_moves = bishop_black.moves(increment, initial_position, board)
    expect(set_of_moves).to eq(expected_set_of_moves)
  end

  it 'returns the correct set of moves for right downward diagonal' do
    increment = { row: 1, column: -1 }
    initial_position = { row: 3, column: 4 }
    expected_set_of_moves = [[4, 3], [5, 2], [6, 1], [7, 0]]
    set_of_moves = bishop_black.moves(increment, initial_position, board)
    expect(set_of_moves).to eq(expected_set_of_moves)
  end

  it 'returns the correct set of moves for left upward diagonal' do
    increment = { row: -1, column: -1 }
    initial_position = { row: 3, column: 4 }
    expected_set_of_moves = [[2, 3], [1, 2], [0, 1]]
    set_of_moves = bishop_black.moves(increment, initial_position, board)
    expect(set_of_moves).to eq(expected_set_of_moves)
  end

  it 'returns the correct set of moves for left downward diagonal' do
    increment = { row: 1, column: 1 }
    initial_position = { row: 3, column: 4 }
    expected_set_of_moves = [[4, 5], [5, 6], [6, 7]]
    set_of_moves = bishop_black.moves(increment, initial_position, board)
    expect(set_of_moves).to eq(expected_set_of_moves)
  end
end
