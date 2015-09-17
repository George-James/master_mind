require_relative "Evaluator.rb"
require_relative "Colors.rb"
require_relative "Player.rb"
require_relative "Level.rb"
require_relative "FileIO"
require "pry"

class Game

  attr_accessor :input, :output, :file

  def initialize(input, output)
    @input = input.new
    @output = output
    @file = FileIO.new("data/game_log.json")
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
    command = input.to_s.downcase ||= "q"

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
    Output.write(Messages::GET_NAME.bold)
    player_name = gets.chomp

    # Ask User to Select Level and instanciate in user_level variable
    Output.write(Messages::SELECT_LEVEL.bold)
    input = @input.get_command.to_i
    user_level = Level.new(input)

    # Create Player instance  and save name and level
    player = Player.new(player_name, user_level)

    # Pass player to computer to serve
    Output.write(Messages::WELCOME_USER, [player.name, player.level.get_num_characters])
    colors = Colors::Colors.generate_colors(player.level.get_num_colors)

    colors.each{|key, color| Output.write("(#{key}): #{color}, ")}

    color_keys = Colors::Colors.get_color_keys(colors)
    color_values = Colors::Colors.get_color_values(colors)

    Output.display_play_instruction(color_keys, color_values)

    computer_guess = color_keys.shuffle



    # POINT WHERE ACTUAL USER GUESSING OCCURS
    trials = 0
    start_time = Time.now
    13.times do
      trials +=1

      if trials == 12
        Output.write_line(Messages::CONSOLE_SEPERATOR)
        Output.write_line(Messages::USER_LOSS, [computer_guess.join("")])
        Output.write_line(Messages::CONSOLE_SEPERATOR)
        break;
      end


      @input.get_command
      user_guess = @input.user_command.to_s.downcase ||= ""


      # Evaluate if user wants to quit game, quit if user types q of quit
      # Also Evalueate if user wants cheats, by typing c or cheats
      if (user_guess == 'q' || user_guess =='quit')
        Output.write_line(Messages::QUIT_GAME)
        sleep(1)
        break
      elsif(user_guess == 'c' || user_guess == 'cheats')
        Output.write_line(Messages::CHEATS, [computer_guess.join("")])
        next
      end

      # Convert user_guess to array and upcase all its elements
      user_guess = user_guess.split("").map{|x| x.upcase }


      # Check to see if user wins, if true compare with top ten, if within range add
      if(user_guess == computer_guess)
        total_time = Evaluator.format_time(Time.now - start_time)
        # Read best top ten players file,
        players_hash  = @file.read

        # Pass the file data to get_players function to convert it to more useable array
        # Collecting scores from only players in the same level as current player
        # p players_hash
        # p user_level
        level_players_list = Player.get_players(players_hash, user_level.get_level.to_s)

        # user Player.compare_players to determine if current user has beaten any previous set record
        # If user has a better score add the user data to data and use the return of
        # Player.compare_players to replace score of previous users at same level as current user

        players_hash[user_level.get_level.to_s] =
            Player.compare_players(players_hash, level_players_list, [player.name, computer_guess.join(""), trials, total_time])

        # Write the new player record to File
        @file.write(players_hash)

        # Output winners Message to user
        Output.write_line(Messages::USER_WIN, [trials, total_time])

        # Loop through best scores list and display
        # count = 1;
        level_players_list.each_with_index do | player, i|
          # Format the total_time variable to e.g 4m10s
          total_time = Evaluator.format_time(player[3].to_i)

          Output.write(Messages::BEST_SCORE, [i+1, player[0], player[1], player[2], total_time, player[1]])
        end

        break
      end

      # Zip user guess and computer guess
      # Pass zipped data into Evalutor to determine amount of exact matches and partial matches
      zipped = user_guess.zip(computer_guess)
      exacts = Evaluator.exacts(zipped)
      partials = Evaluator.partials(zipped)
      Output.write_line(Messages::WRONG_GUESS, [exacts, partials, 12-trials])
    end
  end
end
