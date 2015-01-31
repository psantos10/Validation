require "spec_helper"

describe Resize::Validation do
  subject { Resize::Validation }

  it "load module" do
    subject.validate(integer: 5)
    expect(subject.private_methods.include?(:is_valid?)).to eq(true)
  end

  context "chained validations" do

    it "should return true" do
      validations = Resize::Validation::validates do |v|
        v.validate(integer: 5)
        v.validate(uppercase: "NAME")
        v.validate(boolean: false)
      end

      expect(validations).to eq(true)
    end

    it "should return false" do
      validations = Resize::Validation::validates do |v|
        v.validate(integer: "5")
        v.validate(uppercase: "NAME")
        v.validate(boolean: false)
      end

      expect(validations).to eq(false)
    end

    context "catching errors" do
      it "should return status true and empty array of erros" do
        validations = Resize::Validation::validates! do |v|
          v.validate(integer: 5)
          v.validate(uppercase: "NAME")
          v.validate(boolean: false)
        end

        expect(validations).to eq({:status=>true, :errors=>[]})
        expect(validations[:status]).to eq(true)
        expect(validations[:errors]).to eq([])
      end

      it "should return status false and array with some errors" do
        validations = Resize::Validation::validates! do |v|
          v.validate(integer: "5")
          v.validate(uppercase: "NAME")
          v.validate(boolean: false)
        end

        error = ["The input 5 does not match the rule integer"]
        expect(validations).to eq({:status=>false, :errors=>error})
        expect(validations[:status]).to eq(false)
        expect(validations[:errors]).to eq(error)
      end
    end
  end

  context "validate is integer" do
    it "should return true" do
      expect(subject.validate(integer: 5)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(integer: "five")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(integer: 5)).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(integer: "five")}.to raise_error("The input five does not match the rule integer")
      end
    end
  end

  context "validate is boolean" do
    it "should return true" do
      expect(subject.validate(boolean: true)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(boolean: "true")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(boolean: false)).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(boolean: "false")}.to raise_error("The input false does not match the rule boolean")
      end
    end
  end

  context "validate is string" do
    it "should return true" do
      expect(subject.validate(string: "Matisyahu")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(string: 5)).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(string: "string")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(string: true)}.to raise_error("The input true does not match the rule string")
      end
    end
  end

  context "validate is positive" do
    it "should return true" do
      expect(subject.validate(positive: 5)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(positive: -5)).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(positive: 5)).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(positive: -10)}.to raise_error("The input -10 does not match the rule positive")
      end
    end
  end

  context "validate is negative" do
    it "should return true" do
      expect(subject.validate(negative: -5)).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(negative: 5)).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(negative: -5)).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(negative: 10)}.to raise_error("The input 10 does not match the rule negative")
      end
    end
  end

  context "validate is email" do
    it "should return true" do
      expect(subject.validate(email: "user@example.com.br")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(email: "user@example")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(email: "londerson@gmail.com")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(email: 10)}.to raise_error("The input 10 does not match the rule email")
      end
    end
  end

  context "validade is date" do
    it "should return true" do
      expect(subject.validate(date: "20-12-2015")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(date: "100-120-2015")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(date: "20-12-2015")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(date: "100-120-2015")}.to raise_error("The input 100-120-2015 does not match the rule date")
      end
    end
  end

  context "validate is json" do
    it "should return true" do
      expect(subject.validate(json: '{"name": "resize"}')).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(json: '{"name"; "resize"}')).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(json: '{"name": "resize"}')).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(json: '{"name"; "resize"}')}.to raise_error('The input {"name"; "resize"} does not match the rule json')
      end
    end
  end

  context "validate is multiple" do
    it "should return true" do
      expect(subject.validate(multiple: [9, 3])).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(multiple: [8, 3])).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(multiple: [9, 3])).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(multiple: [8, 3])}.to raise_error("The input [8, 3] does not match the rule multiple")
      end
    end
  end

  context "validate is empty" do
    it "should return true" do
      expect(subject.validate(empty: "")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(empty: "londerson@gmail.com")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(empty: "")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(empty: "londerson@gmail.com")}.to raise_error("The input londerson@gmail.com does not match the rule empty")
      end
    end
  end

  context "validate is downcase" do
    it "should return true" do
      expect(subject.validate(downcase: "my name")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(downcase: "My name")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(downcase: "my name")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(downcase: "My name")}.to raise_error("The input My name does not match the rule downcase")
      end
    end
  end

  context "validate is uppercase" do
    it "should return true" do
      expect(subject.validate(uppercase: "MY NAME")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(uppercase: "My name")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(uppercase: "MY NAME")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(uppercase: "My name")}.to raise_error("The input My name does not match the rule uppercase")
      end
    end
  end

  context "validate is RG" do
    it "should return true" do
      expect(subject.validate(rg: "418757896")).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(rg: "121232123")).to eq(false)
    end

    context "validate with raise error" do
      it "should return true" do
        expect(subject.validate!(rg: "418757896")).to eq(true)
      end

      it "should return false" do
        expect{ subject.validate!(rg: "121232123")}.to raise_error("The input 121232123 does not match the rule rg")
      end
    end
  end

  context "validate is equals" do
    it "should return true" do
      expect(subject.validate(equals: ["rails", "rails"])).to eq(true)
    end

    it "should return false" do
      expect(subject.validate(equals: ["rails", "ruby"])).to eq(false)
    end
  end
end