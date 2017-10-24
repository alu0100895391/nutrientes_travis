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
  end
end
