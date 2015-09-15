class Input
  attr_accessor :user_command
  def initialize

  end

  def user_input (user_command)
    @user_command = user_command
  end

  def get_command
    input = gets.chomp
    @user_command, *params = input.split /\s/
    return @user_command
  end
end
