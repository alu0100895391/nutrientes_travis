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
    it "Existe un método para obtener el nombre del alimento." do
  	expect(@Aliment.nombre).to eq("Yogurt")
    end
    it "Existe un método  para obtener la cantidad de proteínas de un alimento." do
        expect(@Aliment.proteinas).to eq(3.8)
    end
    it "Existe un método  para obtener la cantidad de glúcidos de un alimento." do
        expect(@Aliment.glucidos).to eq(4.9)
    end
 
	


  end
end


