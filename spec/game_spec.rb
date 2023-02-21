require_relative '../modules/game'

describe Game do
  context 'test Game Class' do
    it 'Should have a multiplayer value' do
      game = Game.new('21/04/2017', 'Yes', '03/09/2021')
      expect(game.multiplayer).to eq('Yes')
    end

    it 'can be archived to be true' do
      game = Game.new('05/11/2008', 'No', '03/09/2009')
      game.move_to_archive
      expect(game.archived).to eq(true)
    end
  end
end
