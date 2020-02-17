# Enter the file path of the source file in file
# Enter the number of lines you want in your dummy file
# Enter the new name of the dummy file

require 'csv'
require './lib/dummy_generator'
file = './data/game_teams.csv'

dummy = DummyGenerator.new(file, 50, "dummy_game_teams.csv")
dummy.create_dummy_data
dummy.write_to_file
