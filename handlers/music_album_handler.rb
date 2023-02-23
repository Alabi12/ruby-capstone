require 'json'

module MusicHandler
  def save_albums(albums)
    arr = []
    path = '../storage/music_album.json'

    return unless File.exist?(path)

    albums.map do |album|
      arr << { published_date: album.published_date, on_spotify: album.on_spotify }
    end

    File.write(path, JSON.pretty_generate(arr))
  end

  def fetch_albums
    data = []
    path = '../storage/music_album.json'

    return data if File.zero?(path)

    JSON.parse(File.read(path)).each do |album|
      data << Music.new(album['published_date'], album['on_spotify'])
    end

    data
  end
end
