require_relative 'item_class'

class Book < Item
  attr_accessor :publisher, :cover_state, :published_date

  def initialize(published_date, publisher, cover_state)
    super(published_date, archived: false)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
