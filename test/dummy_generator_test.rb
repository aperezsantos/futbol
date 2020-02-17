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

  def test_it_knows_how_many_lines_needed_in_dummy_file
    file = './data/teams.csv'
    dummy = DummyGenerator.new(file, 8)

    assert_equal 8, dummy.dummy_file_lines
  end

  def test_it_can_create_dummy_data_sets
    #this test needs to be beefed up some
    file = './data/teams.csv'
    dummy = DummyGenerator.new(file, 8)

    dummy.create_dummy_data
    assert_equal 9, dummy.dummy_data_set.length
    assert_equal true, dummy.dummy_data_set.length == dummy.dummy_data_set.uniq.length
    dummy.create_dummy_data.write_to_file
  end



end
