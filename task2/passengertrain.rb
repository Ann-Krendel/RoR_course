class PassengerTrain < Train
  
  attr_reader :list_pass_vans
  def initialize(number)
    @list_pass_vans = []
    @speed = 0
    @number = number
  end

  def add__van(pass_van)
    @list_pass_vans << pass_van if @speed == 0
  end

  def del_van(pass_van)
    @list_pass_vans.delete(pass_van) if @speed == 0
  end

end