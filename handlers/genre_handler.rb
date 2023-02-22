require 'json'

module Genre_Handler
    def save_genre(genres)
        arr = []
        path = '../storage/genre.json'

        return unless File.exist?(path)

        genres.map do |e|
          arr << {name: e.name}
        end

        File.write(path, JSON.generate(arr))
      end

      def fetch_genre 
        path = '../storage/genre.json'

        return [] unless File.exist?(path)

        json_data = File.read(path)
        parsed_data = JSON.parse(json_data)
      
        parsed_data.map do |genre|
          Genre.new(genre['name'])
        end
    end
end
