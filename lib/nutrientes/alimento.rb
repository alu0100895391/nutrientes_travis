class Alimento
 attr_reader :nombre
 attr_reader :proteinas
 attr_reader :glucidos

  def initialize(nombre,proteinas,glucidos)
     @nombre = nombre
     @proteinas = proteinas
     @glucidos = glucidos
  end
end
