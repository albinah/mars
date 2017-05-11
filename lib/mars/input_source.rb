require 'mars/exception'
require 'mars/validator'

module Mars
  class InputSource

    def initialize
      @validator = Validator.new
      @plateau = nil
      @rovers = []
      @rover_data = {}
    end

    def process_data(file_name)
      file_lines = read_file_lines(file_name)
      process_plateau(file_lines.shift)
      i = 1
      
      file_lines.each do |line|
        line.chomp!
        i.odd? ? process_rover_data(line.split) : process_rover(line)
        i += 1
      end
      [@plateau, @rovers]
    end

    private

    def build_plateau(plateau_values)
      Plateau.new(*plateau_values)
    end

    def build_rover(rover_values)
      Rover.new(*rover_values)
    end

    def read_file_lines(file_name)
      File.file?(file_name) ? File.readlines(file_name) : raise(NoFileException.new(file_name))
    end

    def process_plateau(plateau_str)
      values = plateau_str.split
      @validator.is_valid_count?(values, 2)
      values.map! { |v| @validator.parse_to_int!(v) }
      @validator.is_valid_plateau_point? values[0], values[1]
      @plateau = build_plateau(values)
    end

    def process_rover_data(rover_str)
      @validator.is_valid_count?(rover_str, 3)
      @rover_data[:x], @rover_data[:y] = rover_str[0..1].map { |v| @validator.parse_to_int!(v) }
      @validator.is_valid_rover_point? @rover_data[:x], @rover_data[:y]
      @rover_data[:dir] = rover_str[2].to_sym if @validator.is_valid_dir? rover_str[2]
    end

    def process_rover(route_str)
      @rover_data[:route] = route_str.each_char.map { |r| r.to_sym if @validator.is_valid_route? r }
      @rovers.push(build_rover(@rover_data.values))
    end
  end
end
