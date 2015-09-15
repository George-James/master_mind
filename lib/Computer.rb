require_relative "Output.rb"
require_relative "Colors.rb"
require_relative "Input.rb"
require "pry"

class Computer

  attr_accessor :colors, :level, :player, :input, :num_of_colors, :num_of_characters
  def initialize(player)
    @player = player
    @input = Input.new
  end


  def serve()
  end

  def self.Evaluate(value)
    
  end
end
