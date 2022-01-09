class PassengerTrain < Train

  include InstanceCounter
  
  attr_reader :number, :type

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :number, :type, String
  
  def initialize(number, maker)
    @list_pass_vans = []
    @speed = 0
    @number = number
    @type = :passenger
    self.name_factory = maker
    message
    register_instance
  end

end