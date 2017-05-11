require 'test/unit'
require 'mars/input_source'
require 'minitest/mock'

module Mars
  class TestInputSource < Test::Unit::TestCase

    def get_source
      InputSource.new
    end

    def test_process_data_success
      file_data = ["5 5\n", "1 2 N\n", "LMR\n"]
      source = get_source
      source.stub :read_file_lines, file_data do
        plateau, rovers = source.process_data(nil)
        assert_equal plateau.end_x, 5
        assert_equal plateau.end_y, 5
        assert_equal rovers.first.x, 1
        assert_equal rovers.first.y, 2
        assert_equal rovers.first.dir, :N
        assert_equal rovers.first.route, [:L, :M, :R]
      end
    end

    def test_process_data_with_exception
      source = get_source
      err = assert_raises NoFileException do
        source.process_data 'no_file'
      end
      assert_equal "No source file no_file.", err.message
    end
  end
end
