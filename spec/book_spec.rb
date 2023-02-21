require_relative '../modules/book'

describe Book do
  context 'test if it can be archived' do
    it 'test archived is false' do
      book = Book.new('10/07/2019', 'New Times', 'good')
      book.move_to_archive
      expect(book.archived).to eq(false)
    end

    it 'test archived is true because of date' do
      book = Book.new('05/11/2008', 'New Times', 'good')
      book.move_to_archive
      expect(book.archived).to eq(true)
    end

    it 'test archived is true because of cover state' do
      book = Book.new('10/07/2019', 'New Times', 'bad')
      book.move_to_archive
      expect(book.archived).to eq(true)
    end
  end
end
