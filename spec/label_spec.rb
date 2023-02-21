require_relative '../modules/label'
require_relative '../modules/item_class'

describe Label do
  context 'test the label class' do
    it 'label array should contain item' do
      label = Label.new('red', 'color')
      item = Item.new('20/02/2019')
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
