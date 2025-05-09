# frozen_string_literal: true

require_relative '../lib/pieces/knight'

describe Knight do
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
end
