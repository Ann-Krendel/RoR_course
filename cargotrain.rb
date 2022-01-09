class CargoTrain < Train

  include InstanceCounter
  
  attr_reader :number, :type

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :number, :type, String
  
  def initialize(number, maker)
    @list_cargo_vans = []
    @speed = 0
    @number = number
    @type = :cargo
    self.name_factory = maker
    register_instance
  end

end
