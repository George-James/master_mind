attr_accessor :input, :output

def initialize(input, output)
  @input = input.new
  @output = output
end

def start
  # Start the user with message on ouput
  output.start_message
  # Get  user input to determine action
  process_command(@input.get_command)
  # Play Game process_command
  play_game
end

private
def process_command (command)
  case command.downcase
    when /^play$/i
      play_game
    when /^instruction$/i
      instructions
    when /^about$/i
      about_developer
    when /^quit$/i
      quit
    else
      invalid_command
    end
end

def play_game
  msg = "To start the game select a level you would like to play:
    Enter (1) for Beginner,
    Enter (2) for Intermediate,
    Enter (3) for Advanced."
    @output.display_message(msg)
end


def quit
  exit
end

def instructions
  puts "\ngame instructions\n"
end

def about_developer
  puts "\nabout developer\n"
end

def invalid_command
  puts "\ninvalid command\n".red
end
