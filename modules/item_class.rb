class Item
  def initialize(_id, published_date, archived)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end
end
