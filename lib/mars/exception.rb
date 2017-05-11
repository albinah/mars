module Mars
  class Error < StandardError; end

  class InvalidPointException < Error
    def initialize(v)
      msg = "Invalid point #{v}. Point should be an integer."
      super(msg)
    end
  end

  class InvalidRouteException < Error
    def initialize(r)
      msg = "Invalid rover route #{r}. Should be R|L|M."
      super(msg)
    end
  end

  class PlateauPointException < Error
    def initialize(x, y)
      msg = "Invalid plateau point: (#{x}, #{y}). Should be more that zero."
      super(msg)
    end
  end

  class RoverPointException < Error
    def initialize(x, y)
      msg = "Invalid rover point: (#{x}, #{y}). Should be positive number."
      super(msg)
    end
  end

  class RoverInvalidDirection < Error
    def initialize(dir)
      msg = "Invalid rover direction #{dir}. Should be N|E|S|W."
      super(msg)
    end
  end

  class NoFileException < Error
    def initialize(file_name)
      msg = "No source file #{file_name}."
      super(msg)
    end
  end

  class InvalidCountParameters < Error
    def initialize(v_count, count)
      msg = "Invalid count parameters=#{v_count}. Count should be #{count}."
      super(msg)
    end
  end

  class NonFreePointException < Error
    def initialize(x, y, msg = '')
      msg += "Non free point: (#{x}, #{y})."
      super(msg)
    end
  end

  class RoverLandException < NonFreePointException
    def initialize(x, y, msg = '')
      msg += "Can not lang rover. "
      super(x, y, msg)
    end
  end

  class RoverMoveException < NonFreePointException
    def initialize(x, y, msg = '')
      msg += "Can not move rover. "
      super(x, y, msg)
    end
  end
end
