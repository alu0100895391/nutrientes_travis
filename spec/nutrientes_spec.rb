require "spec_helper"
#prueba
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
    it "Existe un método  para obtener la cantidad de grasas de un alimento." do
        expect(@Aliment.grasas).to eq(3.8)
    end
    it "Existe un método para obtener el alimento formateado" do
	expect(@Aliment.to_s).to eq("Yogurt\t3.8\t4.9\t3.8")
    end
    it "Existe un método para obtener el valor energético de un alimento" do
	expect(@Aliment.val_energetico).to eq(170.2)
    end	


  end

context "#Comprobar clase, jerarquía,tipo de objeto" do
        before :each do
                @yogurt = Tipo_alimento.new("Yogurt",3.8,4.9,3.8,"Huevitos")

        end
	
	it "Comprobar la clase de un objeto" do
		expect(@yogurt.class).to eq(Tipo_alimento)
	end

	it "Comprobar la pertenencia a una jerarquía" do
		expect(@yogurt.class.superclass).to eq(Alimento) 
	end

	it "Comprobar el tipo de un objeto" do
		expect(@yogurt.respond_to?(:val_energetico))
	end

	it "Comprobar el tipo de un objeto 2" do
		expect(@yogurt.respond_to?(:proteinas))
	end
	






end


context " Comprobar si la clase alimento es comparable" do
	before :each do
		@yogurt = Alimento.new("Yogurt",3.8,4.9,3.8)
		@huevo = Alimento.new("Huevo",14.1,0.0,19.1)
	end

	it "Comprobar si el valor energito de un alimento es menor que el de otro" do
		expect(@yogurt <  @huevo).to eq(false)
	end


end





end


