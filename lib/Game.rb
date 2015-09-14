require_relative "Computer.rb"
require_relative "Colors.rb"
require_relative "Player.rb"


class Game

  attr_accessor :input, :output

  def initialize(input, output)
    @input = input.new
    @output = output
  end

  def start
    # Display Game Instruction
    @output.display_start_message

    # Ask user if they want to play
    @input ||= @input.new
    input = @input.get_command

    # process the command
    process_command(input)
  end

private
  def process_command (input)
    # Get the first character of the user input and convert to downcase
    command = input.downcase

    if command == "play" || command == "p"
      play()
    elsif command == "instruction" || command == "i" || command == "instructions"
      @output.display_game_instructions()
    elsif command == "background" || command == "b"
      @output.display_about_game()
    elsif command == "quit" || command == "q" || command == "exit"
      @output.exit_game
    end
  end





# This is where the magic happens
  def play
    puts "So you would like to play!"
    puts "Start by telling me your name: "
    player_name = gets.chomp
    player = Player.new(player_name)

    @output.display_select_level_message
    input = @input.get_command.to_i

    computer = Computer.new(Colors::LIST, input, player)
    colors = computer.serve()

    puts ""
  end
end
