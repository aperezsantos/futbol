require 'csv'
require './lib/dummy_generator'
require 'minitest/autorun'
require 'minitest/pride'

class DummyGeneratorTest < Minitest::Test

  def test_it_exists
    file = './data/teams.csv'
    dummy = DummyGenerator.new(file, 8)

    assert_instance_of DummyGenerator, dummy
  end

  def test_it_can_read_how_many_lines_of_data
    file = './data/teams.csv'
    dummy = DummyGenerator.new(file, 8)

    assert_equal 33, dummy.lines_of_data
  end
end
