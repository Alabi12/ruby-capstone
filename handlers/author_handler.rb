require 'json'

module AuthorHandler
  def save_author(authors)
    arr = []
    path = '../storage/author.json'

    return unless File.exist?(path)

    authors.map do |e|
      arr << { first_name: e.first_name, last_name: e.last_name }
    end

    File.write(path, JSON.generate(arr))
  end

  def fetch_author
    path = '../storage/author.json'

    return [] unless File.exist?(path)

    json_data = File.read(path)
    parsed_data = JSON.parse(json_data)

    parsed_data.map do |e|
      Author.new(e['first_name'], e['last_name'])
    end
  end
end
