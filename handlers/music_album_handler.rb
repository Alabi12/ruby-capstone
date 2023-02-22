require 'json'

module Music_Album_Handler
    def save_music_album(music_albums)
        arr = []
        path = '../storage/music_album.json'

        return unless File.exist?(path)

        music_albums.map do |e|
          arr << {publish_date: e.published_date, on_spotify: e.on_spotify}
        end

        File.write(path, JSON.generate(arr))
      end

      def fetch_music_album
        path = '../storage/music_album.json'

        return [] unless File.exist?(path)

        json_data = File.read(path)
        parsed_data = JSON.parse(json_data)
      
        parsed_data.map do |e|
            Music.new(e['publish_date'], e['on_spotify'])
        end
    end
end
