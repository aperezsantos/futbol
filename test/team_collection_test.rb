require 'minitest/autorun'
require 'minitest/pride'
require './lib/team_collection'
require 'csv'

class TeamCollectionTest < Minitest::Test

  def setup
    @team_file_path = './data/teams.csv'
    @team_collection = TeamCollection.new(@team_file_path)
  end

  def test_it_exists

    assert_instance_of TeamCollection, @team_collection
  end

  def test_it_creates_team_objects

    assert_instance_of Team, @team_collection.teams.first
    assert_equal 32, @team_collection.teams.length
  end
end