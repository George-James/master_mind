require_relative "lib/Game.rb"
require_relative "lib/Output.rb"
require_relative "lib/Input.rb"
require_relative "lib/Message.rb"

loop do
  (("%s") % Output.animate_prompt(Messages::WELCOME))
  game = Game.new(Input, Output)
  game.start
end
