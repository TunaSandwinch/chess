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
    context 'diagonal moves' do # rubocop:disable Metrics/BlockLength
      it 'returns the correct set of moves for right upward diagonal' do
        increment = { row: -1, column: 1 }
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[2, 5], [1, 6], [0, 7]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end

      it 'returns the correct set of moves for right downward diagonal' do
        increment = { row: 1, column: -1 }
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[4, 3], [5, 2], [6, 1], [7, 0]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end
      it 'returns the correct set of moves for left upward diagonal' do
        increment = { row: -1, column: -1 }
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[2, 3], [1, 2], [0, 1]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end

      it 'returns the correct set of moves for left downward diagonal' do
        increment = { row: 1, column: 1 }
        initial_position = { row: 3, column: 4 }
        expected_set_of_moves = [[4, 5], [5, 6], [6, 7]]
        set_of_moves = dummy_black.moves(increment, initial_position, board)
        expect(set_of_moves).to eq(expected_set_of_moves)
      end
    end
  end
end
