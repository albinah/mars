require 'test/unit'
require 'mars/rover'

module Mars
  class TestRover < Test::Unit::TestCase

    def get_rover(x, y, dir, route)
      Rover.new(x, y, dir, route)
    end

    def test_move
      rover = get_rover(1, 1, nil, nil)
      rover.move!(2, 3)
      assert_equal rover.x, 2
      assert_equal rover.y, 3
    end

    def test_turn
      rover = get_rover(1, 1, :N, nil)
      rover.turn!(:L)
      assert_equal rover.dir, :W
    end
  end
end
