
class Game
  Colors = {R: "Red", B: "Blue", G: "Green", Y: "Yellow", V: "Violet", P: "Purple"}
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


  def process_command (input)
    # Get the first character of the user input and convert to downcase
    command, *args = input.split /\s/
    command = command.downcase

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

  def play
    @output.display_select_level_message
    input = @input.get_command
    
  end
end
