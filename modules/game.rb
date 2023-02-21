require_relative 'item_class'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :published_date

  def initialize(published_date, multiplayer, last_played_at)
    super(published_date, archived: false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - Date.strptime(@last_played_at, '%d/%m/%Y').year) > 2
  end
end
