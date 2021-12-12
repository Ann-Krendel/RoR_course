require "./models.rb"
class CargoVan
  
  include Producer
  extend InstanceCounter

  attr_reader :number_cargo_van, :type
  def initialize(number_cargo_van)
    type = "cargo"
    @number_cargo_van = number_cargo_van
    @@instances = 0
    self.register_instance
  end
  
end