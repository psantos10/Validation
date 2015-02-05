require "spec_helper"

describe Resize::Validation::Rules::IsBegins do
  before { extend Resize::Validation::Rules::IsBegins }

  context "with valid params" do
    it "should return true" do
      expect(is_valid?("My name is Bond", "My")).to eq(true)
    end
  end

  context "with invalid params" do
    it "should return false" do
      expect(is_valid?("My name is Bond", "Maria")).to eq(false)
    end
  end
end
