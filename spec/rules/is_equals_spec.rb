require "spec_helper"

describe Resize::Validation::Rules::IsEquals do
  before { extend Resize::Validation::Rules::IsEquals }

  context "with valid params" do
    it "should return true" do
      expect(is_valid?("user@example.com", "user@example.com")).to eq(true)
      expect(is_valid?(3, 3)).to eq(true)
      expect(is_valid?([1, 2, 3], [1, 2, 3])).to eq(true)
      expect(is_valid?(1+1, 2)).to eq(true)
      expect(is_valid?({name: "Alfred"}, {name: "Alfred"})).to eq(true)
      expect(is_valid?(Class, Class)).to eq(true)
    end
  end

  context "with invalid params" do
    it "should return false" do
      expect(is_valid?("usergjsgd.com", "user@example.com")).to eq(false)
    end
  end
end