require_relative "lib/FileIO.rb"
require_relative "lib/Player.rb"
require_relative "lib/Level.rb"
require_relative "lib/Message"
require_relative "lib/Output"

file = FileIO.new("data/game_log.json")

 players_list = file.read
list =  Player.get_players(players_list, :Advanced.to_s)
new_data = Player.compare_players(list, ["James George Okpe", "BlackBerry", 8, 2])
players_list["Advanced"] = new_data
# new_data = Player.compare_players(list, ["James George Okpe", "BlackBerry", 8, 2])

# file.write( players_list)

# list.each_with_index do | player, i|
#   Output.write(Messages::BEST_SCORE, [i+1, player[0], player[1], player[2], player[3], player[1]])
# end
#
# level = Level.new(1)
# puts level.get_level
