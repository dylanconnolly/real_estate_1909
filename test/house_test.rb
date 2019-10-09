require 'minitest/autorun'
require 'minitest/pride'
require './lib/house'
require './lib/room'

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

    assert_equal [room_1, room_2], @house.rooms
  end

  def test_rooms_can_be_called_by_category
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert_equal [room_1, room_2], @house.rooms_from_category(:bedroom)
    assert_equal [room_3], @house.rooms_from_category(:living_room)
    assert_equal [], @house.rooms_from_category(:kitchen)
  end

  def test_house_area_can_be_calculated
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert_equal 1900, @house.area

    room_5 = Room.new(:kitchen, 10, 20)
    @house.add_room(room_5)

    assert_equal 1900 + room_5.area, @house.area
  end

  def test_price_per_square_foot_can_be_calculated
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert_equal 210.53, @house.price_per_square_foot

    room_5 = Room.new(:kitchen, 10, 20)
    @house.add_room(room_5)

    assert_equal (400000.00/2100).round(2), @house.price_per_square_foot
  end

  def test_rooms_can_be_sorted_by_size
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert_equal [room_4, room_3, room_2, room_1], @house.rooms_sorted_by_area

    room_5 = Room.new(:kitchen, 10, 20)
    @house.add_room(room_5)

    assert_equal [room_4, room_3, room_5, room_2, room_1], @house.rooms_sorted_by_area
  end

  def test_rooms_can_be_categorized
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)
    @house.add_room(room_1)
    @house.add_room(room_2)
    @house.add_room(room_3)
    @house.add_room(room_4)

    assert_equal hash = {:bedroom=>[room_1, room_2], :living_room=>[room_3], :basement=>[room_4]}, @house.rooms_by_category
  end
end
