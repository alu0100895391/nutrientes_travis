Node = Struct.new(:value, :next, :prev)

Lista = Struct.new(:head, :tail)

class Lista

#	def insertar valor
#
#		nodo = Node.new(valor,nil,nil)
#	
#		if self.head == nil
#			self.head = nodo
#			self.tail = nodo
#		else
#	
#			nodo.prev = self.tail	
#			self.tail.next = nodo
#			self.tail = nodo
#
#		end
#	end

	def insertar *valores
	
	valores.each do |valor|
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


	def extraer_head 
	
		self.head = self.head.next
		self.head.prev = nil
	end


	def extraer_tail
		self.tail = self.tail.prev
		self.tail.next = nil
	end



	def to_s
		cad=""
		nodo = self.head
		while nodo != nil
			cad += nodo.value.to_s + "\n"
			nodo = nodo.next
			
		end

		cad
	end



end
