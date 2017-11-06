require "spec_helper"

RSpec.describe Lista do
it "does something useful" do
    expect(false).to eq(false)
  end

context "#Debe existir un nodo y una lista" do

	before :each do 
		@list = Lista.new(1,8)
	end



	it "Debe existir una lista con su cabeza" do
		expect(@list.head).not_to be nil	
	end
	it "Debe existir una lista con su cola" do
                expect(@list.tail).not_to be nil
        end

end
context "#Inserciones" do
	it "Se puede insertar un elemento en la Lista" do
		@list.insertar(4)
		expect(@list.tail).to eq(4)
	end

end
end
