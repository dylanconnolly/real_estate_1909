require 'minitest/autorun'
require 'minitest/pride'
require '.lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_price_can_be_converted_to_integer
    assert_equal 400000, @house.price
  end

  def test_it_has_an_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_no_rooms_by_default
    assert_equal [], @house.rooms
  end

  def test_rooms_can_be_added_to_it
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    @house.add_room(room_1)
    @house.add_room(room_2)

    assert_equal [Room, Room], @house.rooms
  end
end
