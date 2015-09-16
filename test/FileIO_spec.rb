require_relative "../lib/FileIO.rb"

describe FileIO do
  describe "#Intialize" do
    it "should be able to initialize with empty param" do
      fileIO = FileIO.new

      expect(fileIO.file.exist?).to eql(true)
    end
  end
end
