require "./modules.rb"
class CargoVan
  
  include Producer

  attr_reader :number_cargo_van, :type
  def initialize(number_cargo_van, maker)
    type = "cargo"
    @number_cargo_van = number_cargo_van
    self.name_factory = maker
  end
  
end