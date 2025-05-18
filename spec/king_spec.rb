# frozen_string_literal: true

require_relative '../lib/pieces/king'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/queen'

describe King do # rubocop:disable Metrics/BlockLength
  subject(:king_black) { described_class.new(1, { row: 3, column: 4 }) }
  subject(:king_white) { described_class.new(0, { row: 0, column: 0 }) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe '#inrange_moves' do
    it 'returns an array of with correct values' do
      set_of_moves = king_black.inrange_moves
      expected_set_of_moves = [[2, 3], [3, 3], [4, 3], [4, 4], [4, 5], [3, 5], [2, 5], [2, 4]]
      expected_set_of_moves.each do |move|
        expect(set_of_moves).to include(move)
      end
      expect(set_of_moves.length).to eq(expected_set_of_moves.length)
    end
  end

  describe '#possible_moves' do
    before do
      grid_val[2][3] = double('pawn', color: 1)
      grid_val[3][3] = double('pawn', color: 1)
      grid_val[4][3] = double('pawm', color: 0)
    end
    it 'removes invalid tiles from the set of moves' do
      inrange_moves_result = [
        [2, 3], [3, 3], [4, 3], [4, 4],
        [4, 5], [3, 5], [2, 5], [2, 4]
      ]
      allow(king_black).to receive(:inrange_moves).and_return(inrange_moves_result)

      expected_result = [
        { row: 4, column: 3 },
        { row: 4, column: 4 },
        { row: 4, column: 5 },
        { row: 3, column: 5 },
        { row: 2, column: 5 },
        { row: 2, column: 4 }
      ]

      set_of_moves = king_black.possible_moves(board)

      expected_result.each do |move|
        expect(set_of_moves).to include(move)
      end

      expect(set_of_moves.length).to eq(expected_result.length)
    end
  end

  describe '#checked_diagonaly?' do
    context 'when the move will cause a check' do
      before do
        grid_val[0][3] = Bishop.new(0)
        grid_val[7][1] = Queen.new(0)
        grid_val[0][2] = Bishop.new(0)
        grid_val[1][3] = Pawn.new(1)
      end
      it 'returns true if the move will cause a check by a Bishop' do
        move_position = { row: 2, column: 5 }
        expect(king_black.checked_diagonaly?(move_position, board)).to be(true)
      end
      it 'returns true if the move will cause a check by a Queen' do
        move_position = { row: 4, column: 4 }
        expect(king_black.checked_diagonaly?(move_position, board)).to be(true)
      end
    end
    context 'when the move will not cause a check' do
      it 'returns false if a move will not cause a check' do
        move_position = { row: 3, column: 5 }
        expect(king_black.checked_diagonaly?(move_position, board)).to be(false)
      end
    end
  end

  describe '#checked_horizontaly?' do
    context 'when the move will cause a check' do
      before do
        grid_val[7][3] = Rook.new(0)
        grid_val[2][7] = Queen.new(0)
      end
      it 'returns true if the move will cause a check by a rook' do
        move_position = { row: 2, column: 3 }
        expect(king_black.checked_horizontaly?(move_position, board)).to be(true)
      end

      it 'returns true if the move will cause a check by queen' do
        move_position = { row: 2, column: 3 }
        expect(king_black.checked_horizontaly?(move_position, board)).to be(true)
      end
    end

    context 'when the move will not cause a check' do
      before do
        grid_val[6][4] = Pawn.new(0)
        grid_val[7][4] = Queen.new(0)
      end
      it 'returns false if a move will not cause a check' do
        move_position = { row: 4, column: 4 }
        expect(king_black.checked_horizontaly?(move_position, board)).to be(false)
      end
    end
  end
end
