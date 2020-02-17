require 'csv'

class DummyGenerator
  attr_reader :source_file, :dummy_size, :dummy_data_set
  def initialize(source_file, dummy_size)
  @source_file = source_file
  @dummy_size = dummy_size
  @dummy_data_set = []
  end

  def lines_of_data
    CSV.readlines(@source_file).size
  end

  def dummy_file_lines
    @dummy_size
  end

  def create_dummy_data
    @dummy_data_set << CSV.readlines(@source_file)[0]
    until @dummy_data_set.length == @dummy_size + 1
      @dummy_data_set << CSV.readlines(@source_file)[rand(1..lines_of_data)]
      @dummy_data_set.compact.uniq
    end
    @dummy_data_set
  end

  def write_to_file
    CSV.generate_line(row) do |row|
      require "pry"; binding.pry
    end
  end

end
