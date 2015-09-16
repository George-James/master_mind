require 'colorize'
require_relative "Message.rb"
require_relative "FileIO"

class Output
  def self.animate_prompt(output)
    output.split("").each do |x|
      sleep(0.05)
      print x.red.bold
    end
  end

  def self.display_start_message
    puts Messages::ACTION.green.bold
  end

  def self.display_game_instructions
    puts Messages::GAME_INSTRUCTION.bold
    puts Messages::PRESS_RETURN.green.bold
    gets
    puts Messages::CONSOLE_SEPERATOR.bold
  end

  def self.exit_game
    puts Messages::EXIT_GAME.bold
    puts Messages::CONSOLE_SEPERATOR.bold
    exit
  end

  def self.display_about_game
    puts Messages::ABOUT_GAME.bold
    puts Messages::PRESS_RETURN.green.bold
    gets
    puts Messages::CONSOLE_SEPERATOR.bold


  end

  def self.display_play_instruction(colors_key, colors_value)
    keys = ""
    values = ""
    colors_key.each{|x| keys << "#{x}, "}
    colors_value.each{|x| values << "#{x}, " }
    puts Messages::IN_GAME_INSTRUCTION.bold % [keys, values]
  end

  def self.write(message, args = [])
    print (message % args).bold
  end

  def self.write_line(message, args = [])
    puts (message % args).bold
  end

  def self.write_top_ten(list)
    
  end
end
