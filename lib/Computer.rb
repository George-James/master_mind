require_relative "Output.rb"
require_relative "Colors.rb"
require "pry"

class Computer

  attr_accessor :colors, :level, :player, :input, :num_of_colors, :num_of_characters
  def initialize(player)
    @player = player
    @input = Input.new
  end


  def serve()
    puts "Hello #{@player.name}! I have generated a beginner sequence with #{player.level.get_num_characters} characters made up of:"
    colors = Colors::Colors.generate_colors(player.level.get_num_colors)

    colors.each{|key, color| print "(#{key}): #{color}, "}
    # sleep(7)

    color_keys = Colors::Colors.get_color_keys(colors)
    # color_values = Color::Color.get_color_values(colors)

    # Output.display_play_instruction(color_keys, color_values)



  end

end
