require_relative '../modules/author'
require_relative '../modules/item_class'

describe Author do
  context 'test the author class' do
    it 'author array should contain item' do
      author = Author.new('alabi', 'bob')
      item = Item.new('20/02/2019')
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end
