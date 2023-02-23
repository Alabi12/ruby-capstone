require 'json'

module Book_Handler
    def save_books(books)
        arr = []
        path = '../storage/book.json'

        return unless File.exist?(path)

        books.map do |book|
            arr << {published_date: book.published_date, publisher: book.publisher, cover_state: book.cover_state}
        end

        File.write(path, JSON.pretty_generate(arr))
    end

    def fetch_books
        data = []
        path = '../storage/book.json'

        return data if File.zero?(path)

        JSON.parse(File.read(path)).each do |book|
            data << Book.new(book['published_date'], book['publisher'], book['cover_state'])
        end

        data
    end
end