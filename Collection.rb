class Collection
  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def add_constanta(item)
    @items = item
  end

  def list
    @items
  end

  def select(id)
    @items[id]
  end

  def find_by(key, value)
    @items.find { |v| v[key] == value }
  end
end