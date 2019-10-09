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
    @rooms.map do |room|
      room.length * room.width
    end
  end
end
