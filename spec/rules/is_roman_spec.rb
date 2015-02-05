require "spec_helper"

describe Resize::Validation::Rules::IsRoman do
  before { extend Resize::Validation::Rules::IsRoman }

  context "with valid params" do
    it "should return true" do
      expect(is_valid?("VII")).to eq(true)
      expect(is_valid?("XX")).to eq(true)
    end
  end

  context "with invalid params" do
    it "should return false" do
      expect(is_valid?("VIFOO")).to eq(false)
    end
  end
end
