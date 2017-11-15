# encoding: utf-8
# Este módulo se ha creado para describir
# distintas metodologías de programación
# haciendo uso del Lenguaje de Programación
# Ruby.  
# Con ella se han desarrollado los ejemplos
# de la asignatura Lenguajes y Paradigmas 
# de Programación.
#
# Autor:: Lucía Ledesma Ramos
# Práctica 8
# Fecha: 13 de noviembre de 2017


#Esta clase nodo permite representar un nodo con su valor, su previo, y su siguiente
Node = Struct.new(:value, :next, :prev)
#Esta clase Lista permite representar una Lista con un nodo head y otro tail
Lista = Struct.new(:head, :tail)

class Lista


# Inserta los valores en la lista

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

#Extraemos el primer nodo

	def extraer_head 
	
		self.head = self.head.next
		self.head.prev = nil
	end

#Extraemos el último nodo

	def extraer_tail
		self.tail = self.tail.prev
		self.tail.next = nil
	end

#Formatea la salida de la lista

	def to_s
		cad=""
		each { |val| cad += val.to_s + "\n" }
		cad
	end

#Se incluye el método para Enumerable

def each
        
        nodo = self.head
        while nodo != nil
                yield nodo.value
                nodo = nodo.next
        end
end



end
