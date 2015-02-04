require "spec_helper"

describe Resize::Validation::Rules::IsContains do
  before { extend Resize::Validation::Rules::IsContains }

  context "with valid params" do
    it "should return true" do
      expect(is_valid?("Ruby on Rails", "Rails")).to eq(true)
      expect(is_valid?("Ruby on Rails", "Ruby")).to eq(true)
    end
  end

  context "with invalid params" do
    it "should return false" do
      expect(is_valid?("Ruby on Rails", "Magic")).to eq(false)
    end
  end
end
