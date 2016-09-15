require "spec_helper"

describe NaiveSimilarity do
  it "has a version number" do
    expect(NaiveSimilarity::VERSION).not_to be nil
  end

  describe ".similar" do
    it "returns similar objects" do
      arr = Array.new(10) { |i| {value1: i, value2: i ** 2}}

      similar = NaiveSimilarity::similar(arr[3], arr, :value1, :value2)

      expect(similar).to eq([{:value1=>3, :value2=>9}, {:value1=>4, :value2=>16}, {:value1=>5, :value2=>25}, {:value1=>2, :value2=>4}, {:value1=>6, :value2=>36}, {:value1=>7, :value2=>49}, {:value1=>8, :value2=>64}, {:value1=>9, :value2=>81}, {:value1=>1, :value2=>1}])
    end
  end
end
