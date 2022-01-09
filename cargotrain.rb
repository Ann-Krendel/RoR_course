class CargoTrain < Train

  include InstanceCounter
  
  attr_reader :number, :type
  
  def initialize(number, maker)
    @list_cargo_vans = []
    @speed = 0
    @number = number
    @type = :cargo
    self.name_factory = maker
    valid!
    message
    register_instance
  end

end
