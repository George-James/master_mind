require_relative "../lib/Evaluator.rb"

describe Evaluator do
  describe "Evaluator#Partials" do
    it "Should return correct number of partials count for method with empty array" do
      expect(Evaluator.partials([])).to eq(0)
    end

    it "Should return correct number of partials count for method" do
      expect(Evaluator.partials([['A', 'B'], ['B', 'B'], ['A', 'B'], ['B', 'A']])).to eq(2)
    end

    it "Should return correct number of partials when there is reptition" do
      expect(Evaluator.partials([['Y', 'G'], ['B', 'Z'], ['Z', 'X'], ['X', 'Z'], ['Z', 'X']])).to eq(3)
    end
  end
end
