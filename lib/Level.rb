class Level
  attr_accessor :level

  def initialize(level)
    @level = level
  end

  def get_level
    level_disp = ""
    case @level
    when 1
      level_disp = :Beginner
    when 2
      level_disp = :Intermediate
    when 3
      level_disp = :Advanced
    else
      level_disp = :Beginner
    end
    level_disp
  end

  def get_num_colors
    num_of_colors = 4;
    case @level
    when 1
      num_of_colors = 4
    when 2
      num_of_colors = 5
    when 3
      num_of_colors = 6
    else
      num_of_colors = 4
    end
    num_of_colors
  end

  def get_num_characters
    num_of_characters = 4;
    case @level
    when 1
      num_of_characters = 4
    when 2
      num_of_characters = 6
    when 3
      num_of_characters = 8
    else
      num_of_characters = 4
    end
    num_of_characters
  end

end
