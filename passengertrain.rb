class PassengerTrain < Train

  include InstanceCounter
  
  attr_reader :number, :type
  
  def initialize(number, maker)
    @list_pass_vans = []
    @speed = 0
    @number = number
    @type = :passenger
    self.name_factory = maker
    valid!
    message
    register_instance
  end

end