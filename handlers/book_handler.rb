require 'json'

module BookHandler
  def save_books(books)
    arr = []
    path = '../storage/book.json'

    return unless File.exist?(path)

    books.map do |book|
      arr << { date: book.published_date, publisher: book.publisher, cover_state: book.cover_state }
    end

    File.write(path, JSON.generate(arr))
  end

  def fetch_books
    path = '../storage/book.json'

    return [] unless File.exist?(path)

    json_data = File.read(path)
    parsed_data = JSON.parse(json_data)

    parsed_data.map do |book|
      Book.new(book['date'], book['publisher'], book['cover_state'])
    end
  end
end
