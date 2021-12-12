class CargoTrain < Train

  include InstanceCounter
  
  attr_reader :list_cargo_vans, :number
  
  def initialize(number, maker)
    @list_cargo_vans = []
    @speed = 0
    @number = number
    self.name_factory = maker
    register_instance
  end

  def add_van(cargo_van)
    @list_cargo_vans << cargo_van if @speed == 0 and cargo_van.type == "cargo"
  end

  def del_van(cargo_van)
    @list_cargo_vans.delete(cargo_van) if @speed == 0
  end

end
