require 'json'

module GameHandler
  def save_games(games)
    arr = []
    path = '../storage/game.json'

    return unless File.exist?(path)

    games.map do |game|
      arr << { published_date: game.published_date, multiplayer: game.multiplayer,
               last_played_at: game.last_played_at }
    end

    File.write(path, JSON.pretty_generate(arr))
  end

  def fetch_games
    data = []
    path = '../storage/game.json'

    return data if File.zero?(path)

    JSON.parse(File.read(path)).each do |game|
      data << Game.new(game['published_date'], game['multiplayer'], game['last_played_at'])
    end

    data
  end
end
