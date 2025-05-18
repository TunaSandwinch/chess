# frozen_string_literal: true

require_relative '../lib/modules/moves_generator'
require_relative '../lib/pieces/king'
class DummyClass
  include MovesGenerator
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end
describe MovesGenerator do # rubocop:disable Metrics/BlockLength
  subject('dummy_white') { DummyClass.new(0) }
  subject('dummy_black') { DummyClass.new(1) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe '#moves' do # rubocop:disable Metrics/BlockLength
    context 'bishop moves' do # rubocop:disable Metrics/BlockLength
      it 'returns the correct set of moves for right upward diagonal direction' do
        increment = [-1, 1]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[2, 5], [1, 6], [0, 7]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end

      it 'returns the correct set of moves for right downward diagonal direction' do
        increment = [1, -1]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[4, 3], [5, 2], [6, 1], [7, 0]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end
      it 'returns the correct set of moves for left upward diagonal direction' do
        increment = [-1, -1]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[2, 3], [1, 2], [0, 1]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end

      it 'returns the correct set of moves for left downward diagonal direction' do
        increment = [1, 1]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[4, 5], [5, 6], [6, 7]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end
    end

    context 'rook moves' do # rubocop:disable Metrics/BlockLength
      it 'returns the correct set of moves for upward direction' do
        increment = [-1, 0]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[2, 4], [1, 4], [0, 4]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end

      it 'returns the correct set of moves for downward direction' do
        increment = [1, 0]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[4, 4], [5, 4], [6, 4], [7, 4]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end
      it 'returns the correct set of moves for right direction' do
        increment = [0, 1]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[3, 5], [3, 6], [3, 7]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end

      it 'returns the correct set of moves for left downward diagonal' do
        increment = [0, -1]
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[3, 3], [3, 2], [3, 1], [3, 0]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end
    end

    context 'There is no available moves' do
      before do
        grid_val[2][5] = double('pawn', color: 1)
      end
      it 'returns an empty array if the piece is on the edge' do
        initial_position = { row: 3, column: 0 }
        increment = [0, 1]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to be_empty
      end

      it 'returns an empty array if the first tile of the move contains a piece of same color' do
        initial_position = { row: 3, column: 4 }
        increment = [-1, 1]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to be_empty
      end
    end

    context 'when there is a piece that can be capture' do
      before do
        grid_val[3][6] = double('pawn', color: 0)
      end
      it 'includes that tile as the last move in the array' do
        initial_position = { row: 3, column: 4 }
        increment = [0, 1]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        last_tile = set_of_moves[-1]
        capture_piece_tile = [3, 6]
        expect(last_tile).to eq(capture_piece_tile)
      end
    end
  end
end
