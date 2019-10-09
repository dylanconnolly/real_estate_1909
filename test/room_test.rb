require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_it_exists
    assert_instance_of Room, @room
  end

  def test_it_has_a_category
    assert_equal :bedroom, @room.category

    room_2 = Room.new(:kitchen, 10, 15)

    assert_equal :kitchen, room_2.category
  end

  def test_area_can_be_calculated
    assert_equal 130, @room.area

    room_2 = Room.new(:kitchen, 10, 15)

    assert_equal 150, room_2.area
  end
end
