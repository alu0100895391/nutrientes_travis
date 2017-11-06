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
end
