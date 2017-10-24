class Alimento
  attr_reader :nombre
  attr_reader :proteinas

  def initialize(nombre,proteinas)
     @nombre = nombre
     @proteinas = proteinas
  end
end
