require_relative "FileIO.rb"

class Player

  attr_accessor :name, :level
  def initialize(player_name, level)
    @name = player_name
    @level = level
  end

  def self.get_players(players, level = "Beginner" )
    list = []
    if(players[level] != nil)
      players[level].each do |x|
          # binding.pry
          temp = []
          # p x
          temp << x["name"]
          temp << x["solved"]
          temp << x["count"]
          temp << x["time"]
          list << temp
      end
    else
        # binding.pry
      list = []
    end
    list
  end

  def self.compare_players(players_hash, players, new_data)
    # Compare players guess at index 2 and time at index 3
    # binding.pry
    if(players != nil)
      players.sort_by{|x| x[2].to_i}.map!{|x| x[2].to_i}

      if(players[0].size < 10)
        players.each_with_index do |player_array, i|
          if(player_array[2].to_i > new_data[2].to_i)
            players.insert(i, new_data)
            break
          elsif (player_array[2].to_i == new_data[2].to_i)
            if(player_array[3].to_i > new_data[3].to_i)
              players.insert(i, new_data)
              break
            end
          end
        end
      end
    else
      players = []
    end
    best_ten = players.slice(0..9)

    best_ten_array = []
    best_ten.each do |player|
      data =
      {
        "name": player[0],
        "solved": player[1],
        "count": player[2].to_i,
        "time": player[3].to_i
      }
      best_ten_array << data
    end
    # binding.pry
    best_ten_array
  end
end
