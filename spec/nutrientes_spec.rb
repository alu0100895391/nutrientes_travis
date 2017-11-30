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



		@ig_ind_m0 = ((@c_manzana.aibc(0))/(@azucar.aibc(0)))*100

		@ig_ind_m1 = ((@c_manzana.aibc(1))/(@azucar.aibc(1)))*100


		@ig_manzana = (@ig_ind_m0+@ig_ind_m1)/2

		
		@ig_ind_y0 = ((@yogurt.aibc(0))/(@azucar.aibc(0)))*100

               @ig_ind_y1 = ((@yogurt.aibc(1))/(@azucar.aibc(1)))*100


                @ig_yogurt = (@ig_ind_y0+@ig_ind_y1)/2



                                        
	end

	it "Comprobar que le pasamos los datos" do
		expect(@c_manzana.datos).not_to be nil
	end



	it "Comprobar que realiza el aibc" do
		expect(@c_manzana.aibc(0)).to eq(27.999999999999993)
		expect(@yogurt.aibc(0)).to eq(30.500000000000036)
	end


	it "Comprobar que calcula el indice glucémico del individuo 0 " do
		expect(@ig_ind_m0).to eq(10.937499999999998)
		expect(@ig_ind_m1).to eq(93.49489795918366)
	end
	



	it "Comprobar que calcula el indice glucemico de un alimento" do
		expect(@ig_manzana).to eq(52.21619897959183)
		expect(@ig_yogurt).to eq(41.28866390306122)
	end




end

context "Comprobar el rendimiento de un algoritmo implementado usando bucles for, el método each y el método sort" do

	  before :each do

	@vector = [ Tipo_alimento.new("Huevo frito", 14.1,0.0,19.5,nil, "Huevos, lcteos y helados"),
            Tipo_alimento.new("Leche vaca", 3.3,4.8,3.2,nil, "Huevos, lacteos y helados"),
            Tipo_alimento.new("Yogurt", 3.8, 4.9, 3.8,nil, "Huevos, lacteos y helados"),
            Tipo_alimento.new("Cerdo", 21.5, 0.0, 6.3,nil, "Carnes y derivados"),
            Tipo_alimento.new("Ternera", 21.1, 0.0, 3.1,nil, "Carnes y derivados"),
            Tipo_alimento.new("Pollo",20.6, 0.0, 5.6,nil, "Carnes y derivados"),
            Tipo_alimento.new("Bacalao",  17.7, 0.0, 0.4,nil, "Pescados y mariscos"),
            Tipo_alimento.new("Atun", 21.5, 0.0, 15.5,nil, "Pescados y mariscos"),
            Tipo_alimento.new("Salmon",  19.9, 0.0, 13.6,nil, "Pescados y mariscos"),
            Tipo_alimento.new("Aceite de oliva", 0.0, 0.2, 99.6,nil, "Alimentos grasos"),
            Tipo_alimento.new("Mantequilla", 0.7, 0.0, 83.2,nil, "Alimentos grasos"),
            Tipo_alimento.new("Chocolate", 5.3, 47.0, 30.0,nil, "Alimentos grasos"),
            Tipo_alimento.new("Azucar", 0.0, 99.8, 0.0,nil, "Alimentos ricos en carbohidratos"),
            Tipo_alimento.new("Arroz",6.8, 77.7, 0.6,nil, "Alimentos ricos en carbohidratos"),
            Tipo_alimento.new("Lentejas",  23.5, 52.0, 1.4,nil, "Alimentos ricos en carbohidratos"),
            Tipo_alimento.new("Papas",2.0, 15.4, 0.1,nil, "Alimentos ricos en carbohidratos"),
            Tipo_alimento.new("Tomate", 1.0, 3.5, 0.2,nil, "Verduras y Hortalizas"),
            Tipo_alimento.new("Cebolla", 1.3, 5.8, 0.3,nil, "Verduras y Hortalizas"),
            Tipo_alimento.new("Calabaza", 1.1, 4.8, 0.1,nil, "Verduras y Hortalizas"),
            Tipo_alimento.new("Manzanas", 0.3, 12.4, 0.4,nil, "Frutas"),
            Tipo_alimento.new("Platanos", 1.2, 21.4, 0.2,nil, "Frutas"),
            Tipo_alimento.new("Pera",  0.5, 12.7, 0.3,nil, "Frutas") ]




        end

	it "Comprobar que el método implementado con for funciona" do
		expect(@vector.ord_burbuja[0].to_s).to eq("Tomate\t1.0\t3.5\t0.2")
		expect(@vector.ord_burbuja[@vector.length-1].to_s).to eq("Aceite de oliva\t0.0\t0.2\t99.6")
	end

	        it "Comprobar que el método implementado con el método each funciona" do
                expect(@vector.ord_each[0].to_s).to eq("Tomate\t1.0\t3.5\t0.2")
                expect(@vector.ord_each[@vector.length-1].to_s).to eq("Aceite de oliva\t0.0\t0.2\t99.6")
        end


	it "Comprobar que el método implementado con el método sort funciona" do
                expect(@vector.sort[0].to_s).to eq("Tomate\t1.0\t3.5\t0.2")
                expect(@vector.sort[@vector.length-1].to_s).to eq("Aceite de oliva\t0.0\t0.2\t99.6")
        end



end







end
































