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

  describe '#inrange_capture_moves' do
    context 'when all the moves are in range' do
      it 'returns the same set of moves' do
        expected_set_of_moves = [[5, 1], [5, 3]]
        allow(pawn_white).to receive(:capture_moves).and_return(expected_set_of_moves)
        initial_position = { row: 6, column: 2 }
        set_of_moves = pawn_white.inrange_capture_moves(initial_position)
        expect(set_of_moves).to eql(expected_set_of_moves)
      end
    end

    context 'when one move are out of range' do
      it 'returns only the valid move' do
        initial_set_of_moves = [[5, -1], [5, 1]]
        allow(pawn_white).to receive(:capture_moves).and_return(initial_set_of_moves)
        initial_position = { row: 6, column: 0 }
        set_of_moves = pawn_white.inrange_capture_moves(initial_position)
        expected_move = [[5, 1]]
        expect(set_of_moves).to eq(expected_move)
      end
    end
  end

  describe '#valid_capture_moves' do # rubocop:disable Metrics/BlockLength
    let(:black_horse) { double('horse', color: 1) }
    let(:black_pawn) { double('pawn', color: 1) }
    let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
    let(:board) { double('board', grid: grid_val) }
    context 'when the tile of all the moves is empty' do
      let(:board) { double('board', grid: Array.new(8) { Array.new(8, ' ') }) }
      it 'returns an empty array' do
        capture_moves = [[5, 1], [5, 3]]
        allow(pawn_white).to receive(:inrange_capture_moves).and_return(capture_moves)
        postion = { row: 6, column: 2 }
        valid_moves = pawn_white.valid_capture_moves(postion, board)
        expect(valid_moves.empty?).to be(true)
      end
    end

    context 'when the tile of all the moves has a piece of opposite color' do
      before do
        grid_val[5][1] = black_horse
        grid_val[5][3] = black_pawn
      end

      it 'returns the same set of moves' do
        capture_moves = [[5, 1], [5, 3]]
        allow(pawn_white).to receive(:inrange_capture_moves).and_return(capture_moves)
        postion = { row: 6, column: 2 }
        valid_moves = pawn_white.valid_capture_moves(postion, board)
        expect(valid_moves).to eq(capture_moves)
      end
    end

    context 'when the tile of all the moves has a piece of same color' do
      before do
        grid_val[5][1] = double('queen', color: 0)
        grid_val[5][3] = double('bishop', color: 0)
      end
      it 'returns an empty array' do
        capture_moves = [[5, 1], [5, 3]]
        allow(pawn_white).to receive(:inrange_capture_moves).and_return(capture_moves)
        postion = { row: 6, column: 2 }
        valid_moves = pawn_white.valid_capture_moves(postion, board)
        expect(valid_moves.empty?).to be(true)
      end
    end
  end

  describe '#forward_move' do
    let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
    let(:knight_black) { double('knight', color: 1) }
    let(:knight_white) { double('knight') }
    let(:board) { double('board', grid: grid_val) }
    context 'when the tile of the move is empty' do
      it 'it returns an array containing the move coordinates' do
        initial_position = { row: 2, column: 2 }
        expected_result = [[3, 2]]
        result = pawn_black.forward_move(initial_position, board)
        expect(result).to eq(expected_result)
      end
    end

    context 'when the tile of the move is not empty' do
      before do
        grid_val[3][2] = knight_black
      end
      it 'returns an empty array' do
        initial_position = { row: 2, column: 2 }
        expected_result = []
        result = pawn_black.forward_move(initial_position, board)
        expect(result).to eq(expected_result)
      end
    end
  end

  describe '#available_moves' do
    it 'combines forward moves and valid capture moves' do
      allow(pawn_black).to receive(:forward_move).and_return([[5, 6]])
      allow(pawn_black).to receive(:valid_capture_moves).and_return([[1, 2], [3, 4]])
      set_of_moves = [[5, 6], [1, 2], [3, 4]]
      result = pawn_black.available_moves(1, 2)
      expect(result).to eq(set_of_moves)
    end

    it 'it returns an empty array if there is no valid moves' do
      allow(pawn_black).to receive(:forward_move).and_return([])
      allow(pawn_black).to receive(:valid_capture_moves).and_return([])
      result = pawn_black.available_moves(1, 2)
      expect(result.empty?).to be(true)
    end
  end
end
