# frozen_string_literal: true

require_relative '../lib/pieces/knight'

describe Knight do # rubocop:disable Metrics/BlockLength
  subject('knight_black') { described_class.new(1) }
  subject('knight_white') { described_class.new(0) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe '#possible_moves' do
    it 'returns the correct set of moves at initial position [3, 4]' do
      initial_position = { row: 3, column: 4 }
      expected_set_of_moves = [[1, 3], [1, 5], [2, 6], [4, 6], [2, 2], [4, 2], [5, 3], [5, 5]]
      set_of_moves = knight_black.possible_moves(initial_position)
      expected_set_of_moves.each do |move|
        expect(set_of_moves).to include(move)
      end
      expect(set_of_moves.length).to eq(expected_set_of_moves.length)
    end

    it 'returns the correct set of moves at initial position [3, 0]' do
      initial_position = { row: 3, column: 0 }
      expected_set_of_moves = [[1, 1], [4, 2], [5, 1], [2, 2]]
      set_of_moves = knight_black.possible_moves(initial_position)
      expected_set_of_moves.each do |move|
        expect(set_of_moves).to include(move)
      end
      expect(set_of_moves.length).to eq(expected_set_of_moves.length)
    end
  end

  describe '#available_moves' do
    before do
      grid_val[1][3] = double('pawn', color: 0)
      grid_val[1][5] = double('pawn', color: 1)
      grid_val[5][3] = double('pawn', color: 1)
      grid_val[5][5] = double('pawn', color: 1)
    end

    it 'removes invalid moves' do
      set_of_moves = [[1, 3], [1, 5], [2, 6]]
      allow(knight_black).to receive(:possible_moves).and_return(set_of_moves)
      expected_set_of_moves = [[1, 3], [2, 6]]
      available_moves = knight_black.available_moves([1, 2], board)
      expect(available_moves).to eq(expected_set_of_moves)
    end

    it 'returns an empty array if there is no valid moves' do
      set_of_moves = [[5, 5], [5, 3]]
      allow(knight_black).to receive(:possible_moves).and_return(set_of_moves)
      available_moves = knight_black.available_moves([1, 2], board)
      expect(available_moves).to be_empty
    end

    it 'returns the same array if all elements is a valid move' do
      set_of_moves = [[1, 3], [1, 4], [1, 6]]
      allow(knight_black).to receive(:possible_moves).and_return(set_of_moves)
      available_moves = knight_black.available_moves([1, 2], board)
      expect(available_moves).to eq(set_of_moves)
    end
  end
end
