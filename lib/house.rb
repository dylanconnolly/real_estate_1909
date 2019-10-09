class House
  attr_reader :price,
              :address

  attr_accessor :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end
end
