require 'mars/exception'

module Mars
  class Plateau
    attr_reader :rovers, :end_x, :end_y

    def initialize(end_x, end_y)
      @start_x = 0
      @start_y = 0
      @end_x,  = end_x
      @end_y = end_y
      @rovers = []
    end

    def land_rover(rover)
      is_point_free?(rover.x, rover.y) ?  @rovers.push(rover) : raise(RoverLandException.new(rover.x, rover.y))
    end

    def run_rover
      @rovers.last.route.each { |command| run_command @rovers.last, command }
      puts @rovers.last
    end

    private

    def calculate_point(x, y, dir)
      case dir
      when :N
        y == @end_y ? y = 1 : y += 1
      when :S
        y == @start_y ? y = @end_y - 1 : y -= 1
      when :E
        x == @end_x ? x = 1 : x += 1
      when :W
        x == @start_x ? x = @end_x - 1 : x -= 1
      end

      [x, y]
    end

    def run_command(rover, command)
      [:L, :R].include?(command) ? turn_rover!(rover, command) : move_rover!(rover)
    end

    def turn_rover!(rover, side)
      rover.turn! side
    end
    
    def is_point_free?(x, y)
      @rovers.each do |r|
        return false if x == r.x && y == r.y
      end
      true
    end
    
    def move_rover!(rover)
      x, y = calculate_point(rover.x, rover.y, rover.dir)
      is_point_free?(x, y) ? rover.move!(x, y) : raise(RoverMoveException.new(x, y))
    end
  end
end
