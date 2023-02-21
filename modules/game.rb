require_relative 'item_class'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(published_date, multiplayer, last_played_at, archived: false)
    super(published_date, archived: false)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (DateTime.now.year - @last_played_at) > 2
  end
end
