class Alimento
 attr_reader :nombre
 attr_reader :proteinas
 attr_reader :glucidos
 attr_reader :grasas

  def initialize(nombre,proteinas,glucidos,grasas)
     @nombre = nombre
     @proteinas = proteinas
     @glucidos = glucidos
     @grasas = grasas
     @valor = 0
  end

  def to_s
	 "#{@nombre}\t#{@proteinas}\t#{@glucidos}\t#{@grasas}"
  end

  def val_energetico
	@valor = 10*@proteinas+20*@glucidos+9*@grasas
  end

end


class Tipo_alimento  < Alimento

	def initialize(nombre,proteinas,glucidos,grasas,tipo)
		super(nombre,proteinas,glucidos,grasas)
		@tipo_a = tipo
	end

end
