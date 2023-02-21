class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(self)
    @item.genre = self
  end
end
