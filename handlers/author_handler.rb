require 'json'

module AuthorHandler
  def save_author(authors)
    arr = []
    path = '../storage/author.json'

    return unless File.exist?(path)

    authors.map do |author|
      arr << { first_name: author.first_name, last_name: author.last_name }
    end

    File.write(path, JSON.pretty_generate(arr))
  end

  def fetch_authors
    data = []
    path = '../storage/author.json'

    return data if File.zero?(path)

    JSON.parse(File.read(path)).each do |author|
      data << Author.new(author['first_name'], author['last_name'])
    end

    data
  end
end
