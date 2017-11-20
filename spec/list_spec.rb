require "spec_helper"

RSpec.describe Lista do
it "does something useful" do
    expect(false).to eq(false)
  end

context "#Debe existir un nodo y una lista" do

	before :each do 
		@nodo = Node.new(1,nil,nil)
		@nodo1 = Node.new(3,nil,@nodo)
		@nodo.next=@nodo1
		@list = Lista.new(@nodo,@nodo1)
	end

	it "Debe existir un nodo con su valor" do
                expect(@nodo.value).to eq(1)
        end
        it "Debe existir un nodo con su valor" do
                expect(@nodo.next).not_to be nil
        end

        it "Debe existir un nodo con su valor" do
                expect(@nodo.prev).to be nil
        end


	it "Debe existir una lista con su cabeza" do
		expect(@list.head).not_to be nil	
	end
	it "Debe existir una lista con su cola" do
                expect(@list.tail).not_to be nil
        end

end
context "#Inserciones" do

 before :each do
                @nodo = Node.new(1,nil,nil)
                @nodo1 = Node.new(3,nil,@nodo)
                @nodo.next=@nodo1
                @list = Lista.new(@nodo,@nodo1)
        end

	it "Se puede insertar un elemento en la Lista" do
		@list.insertar(4)
		expect(@list.tail.value).to eq(4)

	end


	it "Se pueden insertar varios elementos en la Lista" do
		@list.insertar(7,6,9)
		expect(@list.to_s).to eq("1\n3\n7\n6\n9\n")
	end


end

context "#Extracciones" do

 before :each do
                @nodo = Node.new(1,nil,nil)
                @nodo1 = Node.new(3,nil,@nodo)
                @nodo.next=@nodo1
                @list = Lista.new(@nodo,@nodo1)
        end

	it "Se extrae el primer elemento de la Lista" do
		@list.extraer_head
		expect(@list.to_s).to eq("3\n")

	end

	it "Se extrae el último elemento de la lista" do
		@list.extraer_tail
		expect(@list.to_s).to eq("1\n")
	end


end

context "#Comprobaciones con la clase alimento" do

	before :each do
	@list = Lista.new(nil,nil)
	@list.insertar( 
	Tipo_alimento.new("Huevo frito", 14.1,0.0,19.5,nil, "Huevos, lcteos y helados"), 
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
        Tipo_alimento.new("Pera",  0.5, 12.7, 0.3,nil, "Frutas")
	)
end
	

it "Extraemos el primer alimento" do
    		 @list.extraer_head
                expect(@list.head.value.to_s).to eq("Leche vaca\t3.3\t4.8\t3.2")

        end

	it "Extraer el último alimento" do
		@list.extraer_tail
		expect(@list.tail.value.to_s).to eq("Platanos\t1.2\t21.4\t0.2")
	end

end


context "# Pruebas con la lista enumerable" do

before :each do
        @list = Lista.new(nil,nil)
        @list.insertar(
        Tipo_alimento.new("Huevo frito", 14.1,0.0,19.5,nil, "Huevos, lcteos y helados"),
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
        Tipo_alimento.new("Pera",  0.5, 12.7, 0.3,nil, "Frutas")
        )

	@lista = Lista.new(nil,nil)
                @lista.insertar(3,2,4,1)
	
	@lista2 = Lista.new(nil,nil)
                @lista2.insertar(3,nil,4,1)
	@lista3 = Lista.new(nil,nil)
		@lista3.insertar(nil,nil,nil)
	@lista4 = Lista.new(nil,nil)
                @lista4.insertar(1,2,3,4,5,6,7,8,9)

end



	it "Comprobar si devuelve el menor de la lista" do
		expect(@list.min.to_s).to eq("Tomate\t1.0\t3.5\t0.2")
	end

	it "Comprobar si devuelve el mayor de la lista" do
                expect(@list.max.to_s).to eq("Aceite de oliva\t0.0\t0.2\t99.6")
        end

	it "Comprobar que ordena la lista" do
		expect(@lista.sort).to eq([1, 2, 3, 4])
	end
	
	it "Comprobar el método all?" do
		expect(@lista.all?).to eq(true)
		expect(@lista2.all?).to eq(false)		
	end


	it "Comprobar el método any?" do
                expect(@lista2.any?).to eq(true)
		expect(@lista3.any?).to eq(false)
        end
	
	it "Comprobar el método collect" do
		expect(@lista.collect{|i| i*i}).to eq([9, 4, 16, 1])
	end


	it "Comprobar el método count" do
		expect(@lista.count).to eq(4)
	end

	it "Comprobar el metodo drop" do
		expect(@lista4.drop(4)).to eq([5, 6, 7, 8, 9])
	end

	it "Comprobar el método detect" do
                expect(@lista.detect{|i| i == 4 }).to eq(4)
		expect(@lista.detect{|i| i == 8 }).to eq(nil)
        end


	
end









end

