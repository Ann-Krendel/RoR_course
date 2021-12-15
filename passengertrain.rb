class PassengerTrain < Train

  include InstanceCounter
  
  attr_reader :list_pass_vans, :number
  
  def initialize(number, maker)
    @list_pass_vans = []
    @speed = 0
    @number = number
    self.name_factory = maker

    is_valid, msg = valid?
    if is_valid == false
      raise StandardError.new(msg)
    end
    
    message
    register_instance
  end

  def add_van(pass_van)
    @list_pass_vans << pass_van if @speed == 0 and pass_van.type == "passenger"
  end

  def del_van(pass_van)
    @list_pass_vans.delete(pass_van) if @speed == 0
  end

end