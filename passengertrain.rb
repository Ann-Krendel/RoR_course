class PassengerTrain < Train
  
  attr_reader :list_pass_vans, :number
  def initialize(number)
    @list_pass_vans = []
    @speed = 0
    @number = number
  end

  def add_van(pass_van)
    @list_pass_vans << pass_van if @speed == 0 and pass_van.type == "passenger"
  end

  def del_van(pass_van)
    @list_pass_vans.delete(pass_van) if @speed == 0
  end

end