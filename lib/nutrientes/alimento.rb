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


# Esta clase permite representar un alimento con su valor protéico, de glúcidos y su valr graso.
# Se ha incluido Comparable


class Alimento
 include Comparable

 attr_reader :nombre
 attr_reader :proteinas
 attr_reader :glucidos
 attr_reader :grasas

#Se asignan los valores nombre, proteinas, glucidos, grasas

  def initialize(nombre,proteinas,glucidos,grasas,datos)
     @nombre = nombre
     @proteinas = proteinas
     @glucidos = glucidos
     @grasas = grasas
     @valor = 0
     @datos = datos
  end
#Formatea la salida de la lista

  def to_s
	 "#{@nombre}\t#{@proteinas}\t#{@glucidos}\t#{@grasas}"
  end



#Calcula el valor energético de un alimento

  def val_energetico
	@valor = 4*@proteinas+4*@glucidos+9*@grasas
  end

# Se define para incluir el mix, max comparable 
#se toma como valor el valor energético

def <=>(other) 

return nil unless other.is_a? Alimento

val_energetico <=> other.val_energetico

end






end

# Esta clase permite representar un alimento con su valor protéico, de glúcidos, su valor graso
# y su tipo. Esta clase es una clase hija de Alimento
# Se ha incluido Comparable

class Tipo_alimento  < Alimento
#Se asignan los valores nombre, proteinas, glucidos, grasas

	def initialize(nombre,proteinas,glucidos,grasas,datos,tipo)
		super(nombre,proteinas,glucidos,grasas,datos)
		@tipo_a = tipo
	end

end
