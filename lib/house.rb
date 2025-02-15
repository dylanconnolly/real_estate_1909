class House
  attr_reader :price,
              :address

  attr_accessor :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    price_int = @price.delete "$"
    price_int.to_i
  end

  def add_room(room_name)
    @rooms << room_name
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      category == room.category
    end
  end

  def area
    area = @rooms.map do |room|
      room.area
    end
    area.inject(:+)
  end

  def price_per_square_foot
    (price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    sizes = @rooms.sort_by do |room|
      room.area
    end
    sizes.reverse
  end

  def rooms_by_category
    rooms = {}
    categories = []
    @rooms.each do |room|
      categories << room.category
    end

    categories.find_all do |cat|
      cat = room.category
      rooms[cat] = rooms_from_category(cat)
    end
  end
end
