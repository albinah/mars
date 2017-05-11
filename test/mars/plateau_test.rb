require 'test/unit'
require 'mars/plateau'
require 'mars/rover'

module Mars
  class TestPlateau < Test::Unit::TestCase

    def get_plateau(x, y)
      Plateau.new(x, y)
    end

    def get_rover(x, y, dir, route)
      Rover.new(x, y, dir, route)
    end

    def test_land_rover_success
      plateau = get_plateau(3, 3)
      rover1 = get_rover(1, 1, nil, nil)
      rover2 = get_rover(2, 2, nil, nil)
      plateau.land_rover rover1
      plateau.land_rover rover2
      assert_equal plateau.rovers.size, 2
    end

    def test_land_rover_failed
      plateau = get_plateau(3, 3)
      rover1 = get_rover(1, 1, nil, nil)
      rover2 = get_rover(1, 1, nil, nil)
      plateau.land_rover rover1
      err = assert_raises RoverLandException do
        plateau.land_rover rover2
      end
      assert_equal "Can not lang rover. Non free point: (1, 1).", err.message
    end

    def test_calculate_point_y_less_plateau_end_y
      plateau = get_plateau(5, 5)
      x, y = plateau.send(:calculate_point, 0, 2, :N)
      assert_equal x, 0
      assert_equal y, 3
    end

    def test_calculate_point_y_more_plateau_end_y
      plateau = get_plateau(5, 5)
      x, y = plateau.send(:calculate_point, 0, 5, :N)
      assert_equal x, 0
      assert_equal y, 1
    end

    def test_calculate_point_y_equal_plateau_start_y
      plateau = get_plateau(5, 5)
      x, y = plateau.send(:calculate_point, 0, 0, :S)
      assert_equal x, 0
      assert_equal y, 4
    end

    def test_calculate_point_x_less_plateau_x
      plateau = get_plateau(5, 5)
      x, y = plateau.send(:calculate_point, 1, 0, :E)
      assert_equal x, 2
      assert_equal y, 0
    end

    def test_calculate_point_x_more_plateau_x
      plateau = get_plateau(5, 5)
      x, y = plateau.send(:calculate_point, 5, 0, :E)
      assert_equal x, 1
      assert_equal y, 0
    end

    def test_calculate_point_x_equal_plateau_start_x
      plateau = get_plateau(5, 5)
      x, y = plateau.send(:calculate_point, 0, 0, :W)
      assert_equal x, 4
      assert_equal y, 0
    end

    def test_run_rover
      $stdout = StringIO.new
      plateau = get_plateau(5, 5)
      rover = get_rover(1, 1, :N, [:M, :M, :M])
      plateau.land_rover rover
      plateau.run_rover
      assert_equal $stdout.string, "1 4 N\n"
    end

    def test_run_rover_with_exception
      plateau = get_plateau(5, 5)
      rover1 = get_rover(1, 1, :N, [:M])
      rover2 = get_rover(1, 1, :N, [:M])
      plateau.land_rover rover1
      plateau.run_rover
      plateau.land_rover rover2
      err = assert_raises RoverMoveException do
        plateau.run_rover
      end
      assert_equal "Can not move rover. Non free point: (1, 2).", err.message
    end

    def test_is_point_free_true
      plateau = get_plateau(3, 3)
      rover = get_rover(1, 1, nil, nil)
      plateau.land_rover rover
      res = plateau.send(:is_point_free?, 2, 2)
      assert_equal res, true
    end

    def test_is_point_free_false
      plateau = get_plateau(3, 3)
      rover = get_rover(1, 1, nil, nil)
      plateau.land_rover rover
      res = plateau.send(:is_point_free?, 1, 1)
      assert_equal res, false
    end
  end
end
