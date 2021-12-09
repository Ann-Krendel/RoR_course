require "./models.rb"
class CargoTrain < Train

  extend Producer
  extend InstanceCounter
  
  attr_reader :list_cargo_vans, :number
  def initialize(number)
    @list_cargo_vans = []
    @speed = 0
    @number = number
  end

  def add_van(cargo_van)
    @list_cargo_vans << cargo_van if @speed == 0 and cargo_van.type == "cargo"
  end

  def del_van(cargo_van)
    @list_cargo_vans.delete(cargo_van) if @speed == 0
  end

end
