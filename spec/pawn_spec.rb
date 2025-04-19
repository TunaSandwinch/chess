# frozen_string_literal: true

require_relative '../lib/pieces/pawn'

describe Pawn do # rubocop:disable Metrics/BlockLength
  subject(:pawn_white) { described_class.new(0) }
  subject(:pawn_black) { described_class.new(1) }

  describe '#white_moves' do
    context 'when row = 6 and column = 2 of position parameter' do
      let(:position) { { row: 6, column: 2 } }
      let(:set_of_moves) { pawn_white.white_moves(position) }
      it 'returns 3 set of moves' do
        expected_length = 3
        expect(set_of_moves.length).to eq(expected_length)
      end

      it 'has correct set of moves' do
        moves = [[5, 2], [5, 1], [5, 3]]
        moves.each do |move|
          expect(set_of_moves.include?(move)).to be(true)
        end
      end
    end
  end

  describe '#black_moves' do
    context 'when row = 2 and column = 2 of position parameter' do
      let(:position) { { row: 2, column: 2 } }
      let(:set_of_moves) { pawn_black.black_moves(position) }
      it 'returns 3 set of moves' do
        expected_length = 3
        expect(set_of_moves.length).to eq(expected_length)
      end

      it 'has correct set of moves' do
        moves = [[3, 2], [3, 1], [3, 3]]
        moves.each do |move|
          expect(set_of_moves.include?(move)).to be(true)
        end
      end
    end
  end
end
