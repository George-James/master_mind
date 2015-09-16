require "json"

class FileIO
  attr_accessor :file, :path

  def initialize(file_path = "../data/game_log.json")
    @path = file_path
    unless File.file?(file_path)
      @file = File.new(file_path, "a+")
    else
      @file = File.open(file_path, "a+")
    end
  end

  def write(data, path = nil)
    path ||= @path
    File.open(path, "w") do |f|
      f.puts data.to_json
    end
  end


  def write_line(text)

  end

  def read(path = nil)
    path ||= @path
    file = File.read(path)
    data = JSON.parse(file)
    data
  end

end
