require 'json'

module Genre_Handler
    def save_genre(genres)
        arr = []
        path = '../storage/genre.json'

        return unless File.exist?(path)

        genres.map do |gen|
            arr << {name: gen.name}
        end

        File.write(path, JSON.pretty_generate(arr))
    end

    def fetch_genres
        data = []
        path = '../storage/genre.json'

        return data if File.zero?(path)

        JSON.parse(File.read(path)).each do |genre|
            data << Genre.new(genre['name'])
        end

        data
    end
end