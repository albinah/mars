require 'mars/version'
require 'mars/rover'
require 'mars/plateau'
require 'mars/validator'
require 'mars/input_source'

module Mars
  class Runner

    def run(file_name)
      source = InputSource.new
      plateau, rovers = source.process_data(file_name)
      rovers.each do |rover|
        plateau.land_rover(rover)
        plateau.run_rover
      end
    end
  end
end
