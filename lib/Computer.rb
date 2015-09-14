require_relative "Output.rb"
require "pry"
class Computer

  attr_accessor :colors, :level, :player, :input
  def initialize(colors, level, player)
    @colors = colors
    @level = level
    @player = player
    @input = Input.new
  end


  def serve
    puts "Hello #{@player.name}! I have generated a beginner sequence with #{level+3} elements made up of:"
    colors = generate_level_colors()

    colors.each{|key, color| print "(#{key}): #{color}, "}
    sleep(7)


    color_keys = get_color_keys(colors)
    color_values = get_color_values(colors)
    Output.display_play_instruction(color_keys, color_values)

    computer_shuffle = color_keys.shuffle
    user_guess = @input.get_command.split("")

    p computer_shuffle
    p user_guess
  end

  def generate_level_colors
   colors  =  {}

     case @level
     when 1
       colors = create_color_list(4)
     when 2
       colors = create_color_list(5)
     when 3
       colors = create_color_list(6)
     else
       colors = create_color_list(4)
     end
     colors
  end


end
private
  def create_color_list (colors_number)

    @colors.to_a.sample(colors_number)
  end

  def get_color_keys (colors)
    keys_array = []
    colors.each{|key, color| keys_array << key.to_s;}
    return keys_array
  end

  def get_color_values(colors)
    values_array = []
    colors.each{|key, color| values_array << color}
    values_array
  end
