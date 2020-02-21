require './lib/stat_tracker'
require './lib/game_collection'
require './lib/game_teams_collection'
require './lib/game_teams'
require './lib/game'
require './lib/team_collection'
require './lib/team'
require 'minitest/autorun'
require 'minitest/pride'

class StatTrackerTest < Minitest::Test
  def setup
    @locations = {
      games: './data/little_games.csv',
      teams: './data/teams.csv',
      game_teams: './data/little_game_teams.csv'
    }
    @stattracker = StatTracker.new(@locations)
    @stattracker.load_game_data
    @stattracker.load_game_team_data
    @stattracker.load_team_data
  end

  def test_it_exists
    assert_instance_of StatTracker, @stattracker
  end

  def test_it_can_load_collections_of_game_team_data
    assert_instance_of GameTeamsCollection, @stattracker.gtc
    assert_equal GameTeams, @stattracker.gtc.game_teams.first.class
  end

  def test_it_can_load_collections_of_game_data
    assert_instance_of GameCollection, @stattracker.game_collection
    assert_equal Game, @stattracker.game_collection.games.first.class
  end

  def test_it_can_load_collections_of_team_data
    assert_instance_of TeamCollection, @stattracker.team_collection
    assert_equal Team, @stattracker.team_collection.teams.first.class
  end

  def test_it_can_return_the_highest_total_score
    assert_equal 5, @stattracker.highest_total_score
  end

  def test_it_can_return_the_biggest_blowout
    assert_equal 1, @stattracker.biggest_blowout
  end

  def test_it_can_return_percentage_ties
    assert_equal 0.0, @stattracker.percentage_ties
  end

  def test_it_can_return_count_of_games_by_season
    expected = {
        "20122013" => 2,
        "20132014" => 1,
        "20142015" => 1
      }
    assert_equal expected, @stattracker.count_of_games_by_season
  end
end
