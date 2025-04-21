# frozen_string_literal: true

require_relative '../lib/pieces/pawn'

describe Pawn do # rubocop:disable Metrics/BlockLength
  subject(:pawn_white) { described_class.new(0) }
  subject(:pawn_black) { described_class.new(1) }

  describe '#white_moves' do # rubocop:disable Metrics/BlockLength
    context 'when the piece color is white' do
      let(:position) { { row: 6, column: 2 } }
      let(:set_of_moves) { pawn_white.capture_moves(position) }
      it 'returns 2 set of moves' do
        expected_length = 2
        expect(set_of_moves.length).to eq(expected_length)
      end

      it 'has correct set of moves' do
        moves = [[5, 1], [5, 3]]
        moves.each do |move|
          expect(set_of_moves.include?(move)).to be(true)
        end
      end
    end

    context 'when the piece color is black' do
      let(:position) { { row: 2, column: 2 } }
      let(:set_of_moves) { pawn_black.capture_moves(position) }
      it 'returns 2 set of moves' do
        expected_length = 2
        expect(set_of_moves.length).to eq(expected_length)
      end

      it 'has correct set of moves' do
        moves = [[3, 1], [3, 3]]
        moves.each do |move|
          expect(set_of_moves.include?(move)).to be(true)
        end
      end
    end
  end

  describe '#valid_capture_moves' do
    context 'when all the moves are in range' do
      it 'returns the same set of moves' do
        expected_set_of_moves = [[5, 1], [5, 3]]
        allow(pawn_white).to receive(:capture_moves).and_return(expected_set_of_moves)
        initial_position = { row: 6, column: 2 }
        set_of_moves = pawn_white.valid_capture_moves(initial_position)
        expect(set_of_moves).to eql(expected_set_of_moves)
      end
    end

    context 'when one move are out of range' do
      it 'returns only the valid move' do
        initial_set_of_moves = [[5, -1], [5, 1]]
        allow(pawn_white).to receive(:capture_moves).and_return(initial_set_of_moves)
        initial_position = { row: 6, column: 0 }
        set_of_moves = pawn_white.valid_capture_moves(initial_position)
        expected_move = [[5, 1]]
        expect(set_of_moves).to eq(expected_move)
      end
    end
  end
end
