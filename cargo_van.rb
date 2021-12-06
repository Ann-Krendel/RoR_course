class CargoVan
  
  attr_reader :number_cargo_van, :type
  def initialize(number_cargo_van)
    type = "cargo"
    @number_cargo_van = number_cargo_van
  end
  
end