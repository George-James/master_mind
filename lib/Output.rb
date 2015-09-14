require 'colorize'

class Output
  def self.animate_prompt(output)
    output.split("").each do |x|
      sleep(0.05)
      print x
    end
    puts ""
  end

  def self.display_start_message
    puts "Would you like to (p)lay, read the (i)nstructions, read a little (b)ackground on Mastermind or (q)uit?".green
  end

  def self.display_select_level_message()
    puts "To start the game select a level you would like to play:
          Enter (1) for Beginner,
          Enter (2) for Intermediate,
          Enter (3) for Advanced."
  end

  def self.display_game_instructions
    puts "\rComputer will generate a Random list of colors, it will be your challenge to decipher \n the order in which theses colors are arranged by the computer\n"
    puts "Press enter to continue"
    gets
    puts "====================================================================================================="
  end

  def self.exit_game
    puts "Thank you for using MasterMind!"
    exit
  end

  def self.display_about_game
    puts "This game was developed as a requirement to getting into Andela "
    puts "Press enter to continue"
    gets
    puts "====================================================================================================="
  end
end
