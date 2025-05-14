# frozen_string_literal: true

require_relative '../lib/pieces/bishop'

describe Bishop do
  subject('bishop_white') { described_class.new(0) }
  subject('bishop_black') { described_class.new(1) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe '#available_moves' do
    it 'returns all the available moves' do
      allow(bishop_white).to receive(:moves).and_return([[2, 2], [2, 3], [2, 4]], [], [], [[0, 0]])
      available_moves = bishop_white.available_moves({ row: 3, column: 4 }, board)
      expect(available_moves).to eq([[2, 2], [2, 3], [2, 4], [0, 0]])
    end
  end
end
