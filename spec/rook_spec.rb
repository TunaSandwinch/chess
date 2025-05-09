# frozen_string_literal: true

require_relative '../lib/pieces/rook'
describe Rook do # rubocop:disable Metrics/BlockLength
  subject(:white_rook) { Rook.new(0) }
  subject(:black_rook) { Rook.new(1) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe '#upward_moves' do # rubocop:disable Metrics/BlockLength
    before do
      grid_val[2][2] = double('pawn', color: 1)
      grid_val[2][3] = double('pawn', color: 0)
    end
    it 'returns an array with the correct set of moves when the last move has a piece of opposite color' do
      initial_position = { row: 6, column: 2 }
      expected_moves = [[5, 2], [4, 2], [3, 2], [2, 2]]
      set_of_moves = white_rook.upward_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(4)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end

    it 'returns an array with the correct set of moves when the last move has a piece of same color' do
      initial_position = { row: 6, column: 3 }
      expected_moves = [[5, 3], [4, 3], [3, 3], [2, 3]]
      set_of_moves = white_rook.upward_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(4)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end

    it 'returns an empty array when there is no valid moves' do
      initial_position = { row: 0, column: 0 }
      set_of_moves = black_rook.upward_moves(initial_position, board)
      expect(set_of_moves).to eq([])
    end
  end

  describe '#downward_moves' do # rubocop:disable Metrics/BlockLength
    before do
      grid_val[5][0] = double('pawn', color: 1)
      grid_val[5][1] = double('pawn', color: 0)
    end
    it 'returns an array with the correct set of moves when the last move has a piece of opposite color' do
      initial_position = { row: 2, column: 0 }
      expected_moves = [[3, 0], [4, 0], [5, 0]]
      set_of_moves = white_rook.downward_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(3)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end
    it 'returns an array with the correct set of moves when the last move has a piece of same color' do
      initial_position = { row: 2, column: 1 }
      expected_moves = [[3, 1], [4, 1], [5, 1]]
      set_of_moves = white_rook.downward_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(3)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end
    it 'returns an empty array when there is no valid moves' do
      initial_position = { row: 7, column: 0 }
      set_of_moves = black_rook.downward_moves(initial_position, board)
      expect(set_of_moves.empty?).to be(true)
    end
  end

  describe '#right_moves' do # rubocop:disable Metrics/BlockLength
    before do
      grid_val[5][7] = double('pawn', color: 0)
      grid_val[4][7] = double('pawn', color: 1)
    end
    it 'returns an array with the correct set of moves when the last move has a piece of opposite color' do
      initial_position = { row: 5, column: 3 }
      expected_moves = [[5, 4], [5, 5], [5, 6], [5, 7]]
      set_of_moves = white_rook.right_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(4)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end
    it 'returns an array with the correct set of moves when the last move has a piece of same color' do
      initial_position = { row: 4, column: 3 }
      expected_moves = [[4, 4], [4, 5], [4, 6], [4, 7]]
      set_of_moves = white_rook.right_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(4)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end
    it 'returns an empty array when there is no valid moves' do
      initial_position = { row: 0, column: 7 }
      set_of_moves = white_rook.right_moves(initial_position, board)
      expect(set_of_moves.empty?).to be(true)
    end
  end

  describe '#left_moves' do # rubocop:disable Metrics/BlockLength
    before do
      grid_val[3][2] = double('pawn', color: 0)
      grid_val[4][2] = double('pawn', color: 1)
    end
    it 'returns an array with the correct set of moves if the last moves has the same color' do
      initial_position = { row: 3, column: 6 }
      expected_moves = [[3, 5], [3, 4], [3, 3], [3, 2]]
      set_of_moves = white_rook.left_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(4)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end

    it 'returns an array with the correct set of moves if the last moves has the opposite color' do
      initial_position = { row: 4, column: 6 }
      expected_moves = [[4, 5], [4, 4], [4, 3], [4, 2]]
      set_of_moves = white_rook.left_moves(initial_position, board)
      moves_length = set_of_moves.length
      expect(moves_length).to eq(4)
      expected_moves.each do |expected_move|
        expect(set_of_moves).to include(expected_move)
      end
    end

    it 'returns an empty array if there is no valid moves' do
      initial_position = { row: 4, column: 0 }
      set_of_moves = white_rook.left_moves(initial_position, board)
      expect(set_of_moves.empty?).to be(true)
    end
  end

  describe '#continue_step?' do
    before do
      grid_val[4][1] = double('pawn', color: 1)
      grid_val[4][2] = double('pawn', color: 0)
    end

    it 'returns false if the position has a piece of opposite color' do
      position = { row: 4, column: 1 }
      result = white_rook.continue_step?(position, board)
      expect(result).to be false
    end

    it 'returns false if the position has a piece of same color' do
      position = { row: 4, column: 2 }
      result = white_rook.continue_step?(position, board)
      expect(result).to be false
    end

    it 'it returns true if the position is empty' do
      position = { row: 4, column: 3 }
      result = white_rook.continue_step?(position, board)
      expect(result).to be true
    end
  end
end
