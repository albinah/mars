require 'mars/exception'

module Mars
  class Validator
    VALID_DIR = ['N', 'E', 'S', 'W']
    VALID_ROUTE = ['R', 'L', 'M']

    def parse_to_int!(value)
      Integer(value)
    rescue ArgumentError
      raise InvalidPointException.new(value)
    end

    def is_valid_route?(r)
      raise InvalidRouteException.new(r) unless VALID_ROUTE.include? r
      true
    end

    def is_valid_plateau_point?(x, y)
      raise PlateauPointException.new(x, y) unless x > 0 && y > 0
      true
    end

    def is_valid_rover_point?(x, y)
      raise RoverPointException.new(x, y) unless x >= 0 && y >= 0
      true
    end

    def is_valid_count?(values, count)
      raise InvalidCountParameters.new(values, count) unless values.size == count
      true
    end

    def is_valid_dir?(dir)
      raise RoverInvalidDirection.new(dir) unless VALID_DIR.include? dir
      true
    end
  end
end
