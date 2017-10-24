require "spec_helper"

RSpec.describe Nutrientes do
  it "has a version number" do
    expect(Nutrientes::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  describe Alimento do
    it "Debe existir un nombre para cada alimento" do
      expect(Alimento.new("Yogurt").nombre).to eq("Yogurt")
    end
    	it "Debe existir la cantidad de proteínas del alimento en gramos" do
    		expect(Alimento.new("Yogurt",[3.8]).proteinas).to eq(3.8)
	end
  end
end
