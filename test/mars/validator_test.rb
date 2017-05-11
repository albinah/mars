require 'test/unit'
require 'mars/validator'

module Mars
  class TestValidator < Test::Unit::TestCase

    def get_validator
      Validator.new
    end

    def test_parse_to_int_true
      validator = get_validator
      res = validator.parse_to_int!('10')
      assert_equal res, 10
    end

    def test_parse_to_int_invalid
      validator = get_validator
      err = assert_raises InvalidPointException do
        validator.parse_to_int! 'A'
      end
      assert_equal "Invalid point A. Point should be an integer.", err.message
    end

    def test_is_valid_route_right_valid
      validator = get_validator
      res = validator.is_valid_route? 'R'
      assert_equal res, true
    end

    def test_is_valid_route_left_valid
      validator = get_validator
      res = validator.is_valid_route? 'L'
      assert_equal res, true
    end

    def test_is_valid_route_move_valid
      validator = get_validator
      res = validator.is_valid_route? 'M'
      assert_equal res, true
    end

    def test_is_valid_route_invalid
      validator = get_validator
      err = assert_raises InvalidRouteException do
        validator.is_valid_route? 'A'
      end
      assert_equal "Invalid rover route A. Should be R|L|M.", err.message
    end

    def test_is_valid_plateu_point_valid
      validator = get_validator
      res = validator.is_valid_plateau_point?(1, 2)
      assert_equal res, true
    end

    def test_is_valid_plateu_point_invalid
      validator = get_validator
      err = assert_raises PlateauPointException do
        validator.is_valid_plateau_point?(0, -5)
      end
      assert_equal "Invalid plateau point: (0, -5). Should be more that zero.", err.message
    end

    def test_is_valid_rover_point_valid
      validator = get_validator
      res = validator.is_valid_rover_point?(0, 3)
      assert_equal res, true
    end

    def test_is_valid_rover_point_invalid
      validator = get_validator
      err = assert_raises RoverPointException do
        validator.is_valid_rover_point?(0, -1)
      end
      assert_equal "Invalid rover point: (0, -1). Should be positive number.", err.message
    end

    def test_is_valid_count_valid
      validator = get_validator
      res = validator.is_valid_count?([1, 2], 2)
      assert_equal res, true
    end

    def test_is_valid_count_invalid
      validator = get_validator
      err = assert_raises InvalidCountParameters do
        validator.is_valid_count?([1, 2, 3], 2)
      end
      assert_equal "Invalid count parameters=[1, 2, 3]. Count should be 2.", err.message
    end

    def test_is_valid_dir_north_valid
      validator = get_validator
      res = validator.is_valid_dir? 'N'
      assert_equal res, true
    end

    def test_is_valid_dir_east_valid
      validator = get_validator
      res = validator.is_valid_dir? 'E'
      assert_equal res, true
    end

    def test_is_valid_dir_south_valid
      validator = get_validator
      res = validator.is_valid_dir? 'S'
      assert_equal res, true
    end

    def test_is_valid_dir_west_valid
      validator = get_validator
      res = validator.is_valid_dir? 'W'
      assert_equal res, true
    end

    def test_is_valid_dir_invalid
      validator = get_validator
      err = assert_raises RoverInvalidDirection do
        validator.is_valid_dir? 'A' 
      end
      assert_equal "Invalid rover direction A. Should be N|E|S|W.", err.message
    end
  end
end
