# frozen_string_literal: true

require_relative '../lib/pieces/rook'
require_relative '../lib/modules/moves_generator'
describe Rook do
  subject(:white_rook) { Rook.new(0) }
  subject(:black_rook) { Rook.new(1) }
  let(:grid_val) { Array.new(8) { Array.new(8, ' ') } }
  let(:board) { double('board', grid: grid_val) }

  describe '#available_moves' do
    it 'returns all the available moves' do
      allow(white_rook).to receive(:moves).and_return([[2, 2], [2, 3], [2, 4]], [], [], [[0, 0]])
      available_moves = white_rook.available_moves({ row: 3, column: 4 }, board)
      expect(available_moves).to eq([[2, 2], [2, 3], [2, 4], [0, 0]])
    end
  end
end
