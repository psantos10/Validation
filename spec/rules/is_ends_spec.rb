require "spec_helper"

describe Resize::Validation::Rules::IsEnds do
  before { extend Resize::Validation::Rules::IsEnds }

  context "with valid params" do
    it "should return true" do
      expect(is_valid?("My name is Bond", "Bond")).to eq(true)
    end
  end

  context "with invalid params" do
    it "should return false" do
      expect(is_valid?("My name is Bond", "Maria")).to eq(false)
    end
  end
end
