require_relative 'item_class'

class Music < Item
  attr_accessor :on_spotify, :published_date

  def initialize(published_date, on_spotify, archived: false)
    super(published_date, archived: false)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify == true
  end
end
