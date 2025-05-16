# frozen_string_literal: true

require_relative '../lib/pieces/king'

describe King do
  subject(:king_black) { described_class.new(0, { row: 3, column: 4 }) }
  subject(:king_white) { described_class.new(1, { row: 0, column: 0 }) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe 'in_range_moves' do
    it 'returns an array of with correct values' do
      set_of_moves = king_black.inrange_moves
      expected_set_of_moves = [[2, 3], [3, 3], [4, 3], [4, 4], [4, 5], [3, 5], [2, 5], [2, 4]]
      expected_set_of_moves.each do |move|
        expect(set_of_moves).to include(move)
      end
      expect(set_of_moves.length).to eq(expected_set_of_moves.length)
    end
  end
end
