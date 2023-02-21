require_relative '../modules/genre'
require_relative '../modules/item_class'

describe Genre do
  context 'test the genre class' do
    it 'genre array should contain item' do
      genre = Genre.new('boby')
      item = Item.new('20/02/2019')
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
