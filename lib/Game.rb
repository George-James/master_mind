require_relative "Evaluator.rb"
require_relative "Colors.rb"
require_relative "Player.rb"
require_relative "Level.rb"

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
# Processes User Input to determine user action, to play game, read instruction or see the about game
  def process_command (input)
    # Get the first character of the user input and convert to downcase
    command = input.downcase ||= "q"

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

    # Ask User to Select Level and save in user_level variable
    @output.display_select_level_message
    input = @input.get_command.to_i
    user_level = Level.new(input)

    # Create Player instance  and save name and level
    player = Player.new(player_name, user_level)

    # Pass player to computer to serve
    # computer = Computer.new(player)
    # colors = computer.serve()

    puts "Hello #{player.name}! I have generated a beginner sequence with #{player.level.get_num_characters} characters made up of:"
    colors = Colors::Colors.generate_colors(player.level.get_num_colors)

    colors.each{|key, color| print "(#{key}): #{color}, "}

    puts ""

    color_keys = Colors::Colors.get_color_keys(colors)
    color_values = Colors::Colors.get_color_values(colors)

    Output.display_play_instruction(color_keys, color_values)

    computer_guess = color_keys.shuffle


    trials = 0
    # POINT WHERE ACTUAL USER GUESSING OCCURS
    12.times do
      trials +=1
      @input.get_command
      user_guess = @input.user_command.to_s.downcase ||= ""


      # Evaluate if user wants to quit game
      if (user_guess == 'q' || user_guess =='quit')
        puts "Alrighty! cleaning up ..."
        sleep(1)
        break
      end

      user_guess = user_guess.split("").map{|x| x.upcase }
      # Evaluate guesses

      if(user_guess == computer_guess)
        puts "Insane! you are a Mastermind, you got the right sequence in #{12-trials} trial(s)"
        puts "Please play again?"
        break
      end

      zipped = user_guess.zip(computer_guess)
      exacts = Evaluator.exacts(zipped)
      partials = Evaluator.partials(zipped)

      puts "You have #{exacts} exacts and #{partials} partials, keep on trying! you still have #{trials} trials left"

    end
  end
end
