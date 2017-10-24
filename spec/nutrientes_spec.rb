require "spec_helper"

RSpec.describe Nutrientes do
  it "has a version number" do
    expect(Nutrientes::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(false)
  end

  describe Alimento do
	before :each do	
		@Aliment = Alimento.new("Yogurt",3.8,4.9,3.8)
	end


    it "Debe existir un nombre para cada alimento" do
      expect(@Aliment.nombre).not_to be nil
    end
    it "Debe existir la cantidad de proteínas del alimento en gramos" do
    	expect(@Aliment.proteinas).not_to be nil
    end
    it "Debe existir la cantidad de glúcidos del alimento en gramos" do
	expect(@Aliment.glucidos).not_to be nil
    end
    it "Debe exixtir la cantidad de grasas del alimento en gramos" do
	expect(@Aliment.grasas).not_to be nil
    end
  end
end


