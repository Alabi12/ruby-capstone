class Label
  attr_reader :id
  attr_accessor :title, :items, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(self)
    item.label = self
  end
end
