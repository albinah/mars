module Mars
  class Rover
    LEFT_DIR = { N: :W, W: :S, S: :E, E: :N }
    RIGHT_DIR = { N: :E, E: :S, S: :W, W: :N }
    attr_reader :x, :y, :dir, :route

    def initialize(x, y, dir, route)
      @x = x
      @y = y
      @dir = dir
      @route = route
    end

    def move!(x, y)
      @x = x
      @y = y
    end

    def turn!(side)
      @dir = LEFT_DIR[@dir] if side == :L
      @dir = RIGHT_DIR[@dir] if side == :R
    end

    def to_s
      "#{@x} #{@y} #{@dir}"
    end
  end
end
