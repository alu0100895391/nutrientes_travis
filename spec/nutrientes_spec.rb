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
		@Aliment = Alimento.new("Yogurt",3.8,4.9,3.8,nil)
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
	expect(@Aliment.val_energetico).to eq(69.0)
    end	


  end

context "#Comprobar clase, jerarquía,tipo de objeto" do
        before :each do
                @yogurt = Tipo_alimento.new("Yogurt",3.8,4.9,3.8,nil,"Huevos y lácteos")

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
		@yogurt = Alimento.new("Yogurt",3.8,4.9,3.8,nil)
		@huevo = Alimento.new("Huevo",14.1,0.0,19.1,nil)
		@list = Lista.new(nil,nil)
		 @leche = Tipo_alimento.new("leche",3.5,4.7,3.8,nil,"Huevos y lácteos")
	end

	it "Comprobar si el valor energético de un alimento es menor que el de otro" do
		expect(@yogurt <  @huevo).to eq(true)
	end

	it "Comprobar si el valor energético de un alimento es mayor que el de el otro" do
		expect(@yogurt > @huevo).to eq(false)
	end 
	
	it "Comprobar que no se puede comparar el valor energético con una instancia de otra clase" do
		expect(@yogurt == @list).to eq(false)
	end

	it "Comprobar que no se puede comparar el valor energético con un número" do
		expect(@yogurt ==  2).to eq(false)
	end

	it "Comprobar que el valor energético de dos alimentos es igual" do
                expect(@yogurt == @yogurt).to eq(true)
        end


	it "Comprobar que el valor energético de dos alimentos son diferentes" do
                expect(@yogurt == @huevo).to eq(false)
        end




	it "Comprobar que el valor energético de un  alimento y un tipo_alimento se pueden comparar" do
                expect(@yogurt < @leche).to eq(false)
        end



end

context "Comprobar el cálculo del aibc, el indice glucémico de un individuo y el índice glucémico de un alimento" do
	before :each do
		@c_manzana=Alimento.new("c_manzana",14.1,0.0,19.1,[[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9],
                    						   [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]])
		@azucar=Alimento.new("azucar",0.0,99.8,0.0,[[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1],
					                  [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]])

		 @yogurt = Alimento.new("Yogurt",3.8,4.9,3.8,[[6.1 ,6.6 ,6.3 ,6.3 ,6.1 ,6.9 ,6.8 ,6.5 ,6.4 ,6.9 ,6.8 ,6.5 ,6.3 ,6.2 ,6.7 ,6.2 ,5.9 ,5.8 ,5.8 ,5.8 ,5.8 ,5.8 ,5.9 ,6.2 ,6.4],
           						     [4.9 ,4.9 ,5.2 ,5.8 ,6.5 ,7.0 ,7.2 ,7.3 ,7.3 ,6.6 ,6.2 ,6.1 ,6.0 ,6.1 ,5.9 ,5.9 ,5.9 ,5.9 ,5.8 ,5.8 ,5.5 ,5.5 ,5.6 ,5.9 ,5.9]])



		@ig_ind_m0 = ((@c_manzana.aibc @c_manzana.datos[0])/(@azucar.aibc @azucar.datos[0]))*100

		@ig_ind_m1 = ((@c_manzana.aibc @c_manzana.datos[1])/(@azucar.aibc @azucar.datos[1]))*100


		@ig_manzana = (@ig_ind_m0+@ig_ind_m1)/2

		
		@ig_ind_y0 = ((@yogurt.aibc @yogurt.datos[0])/(@azucar.aibc @azucar.datos[0]))*100

                @ig_ind_y1 = ((@yogurt.aibc @yogurt.datos[1])/(@azucar.aibc @azucar.datos[1]))*100


                @ig_yogurt = (@ig_ind_y0+@ig_ind_y1)/2



                                        
	end

	it "Comprobar que le pasamos los datos" do
		expect(@c_manzana.datos).not_to be nil
	end



	it "Comprobar que realiza el aibc" do
		expect(@c_manzana.aibc @c_manzana.datos[0]).to eq(27.49999999999999)
		expect(@yogurt.aibc @yogurt.datos[0]).to eq(21.750000000000046)
	end


	it "Comprobar que calcula el indice glucémico del individuo 0 " do
		expect(@ig_ind_m0).to eq(10.742187499999996)
		expect(@ig_ind_m1).to eq(98.25737265415549)
	end
	



	it "Comprobar que calcula el indice glucemico de un alimento" do
		expect(@ig_manzana).to eq(54.499780077077745)
		expect(@ig_yogurt).to eq(41.37941416722519)
	end




end



end
































