# frozen_string_literal: true

require_relative '../lib/modules/moves_validator'

class DummyClass
  include MovesValidator
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end
describe MovesValidator do
  let(:dummy_white) { DummyClass.new(0) }
  let(:pawn_black) { double('pawn', color: 1) }
  let(:pawn_white) { double('pawn', color: 0) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }
  describe '#validate_last_move' do
    before do
      grid_val[2][0] = pawn_black
      grid_val[2][1] = pawn_white
    end

    it 'return the same array of moves if the last move is an empty tile' do
      set_of_moves = [[4, 2], [3, 2], [2, 2], [1, 2], [0, 2]]
      result = dummy_white.validate_last_move(set_of_moves, board)
      expect(result).to eq(set_of_moves)
    end

    it 'returns the same array of moves if the last move has a piece of opposite color' do
      set_of_moves = [[4, 0], [3, 0], [2, 0]]
      result = dummy_white.validate_last_move(set_of_moves, board)
      expect(result).to eq(set_of_moves)
    end

    it 'returns an array without the last element if the last move has a piece of same color' do
      set_of_moves = [[4, 1], [3, 1], [2, 1]]
      result = dummy_white.validate_last_move(set_of_moves, board)
      expected_result = [[4, 1], [3, 1]]
      expect(result).to eq(expected_result)
    end
  end
end
