require 'date'

class Item
  attr_reader :id
  attr_accessor :published_date, :archived, :genre, :author, :label

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    date = Date.strptime(@published_date, '%d/%m/%Y')
    (Time.now.year - date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    self.genre = (genre)
    genre.add_item(self)
  end

  def add_author(author)
    self.author = (author)
    author.add_item(self)
  end

  def add_label(label)
    self.label = (label)
    label.add_item(self)
  end
end
