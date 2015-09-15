require_relative "lib/Game.rb"
require_relative "lib/Output.rb"
require_relative "lib/Input.rb"

loop do
  (("%s") % Output.animate_prompt("Welcome to MASTERMIND!"))
  game = Game.new(Input, Output)
  game.start
end
  
