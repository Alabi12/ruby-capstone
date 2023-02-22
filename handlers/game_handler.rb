require 'json'

module GameHandler
  def save_game(games)
    arr = []
    path = '../storage/game.json'

    return unless File.exist?(path)

    games.map do |e|
      arr << { publish_date: e.published_date, multiplayer: e.multiplayer, last_played_at: e.last_played_at }
    end

    File.write(path, JSON.generate(arr))
  end

  def fetch_game
    path = '../storage/game.json'

    return [] unless File.exist?(path)

    json_data = File.read(path)
    parsed_data = JSON.parse(json_data)

    parsed_data.map do |e|
      Game.new(e['publish_date'], e['multiplayer'], e['last_played_at'])
    end
  end
end
