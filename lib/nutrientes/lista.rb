

Node = Struct.new(:value, :next, :prev)

Lista = Struct.new(:head, :tail)

class Lista

	def insertar valor

	nodo = Node.new(valor,nil,nil)
	
	if self.head == nil
		self.head = nodo
		self.tail = nodo
	else
	
	nodo.prev = self.tail	
	self.tail.next = nodo
	self.tail = nodo

	end
	end



end
