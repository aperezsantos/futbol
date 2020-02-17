require 'csv'

class DummyGenerator
  attr_reader :source_file, :dummy_size
  def initialize(source_file, dummy_size)
  @source_file = source_file
  @dummy_size = dummy_size
  end

  def lines_of_data
    CSV.readlines(@source_file).size
  end

  def create_dummy_data
    dummy_data_set = []
    dummy_data_set << CSV.readlines(@source_file)[0]
    until dummy_data_set.length == @dummy_size
      dummy_data_set << CSV.readlines(@source_file)[rand(1..CSV.readlines(@source_file).size)]
      dummy_data_set.compact.uniq
    end
    dummy_data_set
      require "pry"; binding.pry
  end

end
