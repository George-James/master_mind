require_relative  "Processor.rb"

class Game
  attr_accessor :input, :output
  def initialize(input, output)
    @input = input
    @output = output
    output.start_message
  end

  def start
    
  end
end
