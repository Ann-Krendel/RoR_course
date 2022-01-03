require "./modules.rb"
class Train

  include Producer
  include InstanceCounter
  
  attr_reader :station, :number, :list_vans


  def initialize(number, maker)
    @number = number
    @speed = 0
    @list_vans=[]
    self.name_factory = maker
    valid!
    message
    register_instance
  end

  def valid!
    raise StandardError.new("invalid number\n\n") if @number !~ /^([a-zA-Z]|\d){3}-*([a-zA-Z]|\d){2}$/
    raise StandardError.new("invalid factory\n\n") if self.name_factory == ""
    true
  end

  def valid?
    if @number !~ /^([a-zA-Z]|\d){3}-*([a-zA-Z]|\d){2}$/ || self.name_factory == ""
      return false
    end
    true
  end

  def add_station(station)
    @station = station
  end

  def next_station
    list = @route.list_stations
    if @station == list[-1]
      return @station
    else
      return list[list.index { |x| x == @station } + 1]
    end
  end

  def previous_station
    list = @route.list_stations
    if @station == list[0]
      return @station
    else
      return list[list.index { |x| x == @station} - 1]
    end
  end

  def add_van(van)
    @list_vans << van if @speed == 0
  end

  def del_van(van)
    @list_vans.delete(van) if @speed == 0
  end

  def add_route(route)
    @route = route
    @station.depart_train(self) if @station != nil
    @station = route.first_station()
    @station.add_train(self)
  end

  def go_forward
    @station.depart_train(self)
    @station = self.next_station
    @station.add_train(self)
  end

  def go_back
    @station.depart_train(self)
    @station = self.previous_station
    @station.add_train(self)
  end

  def self.find(number)
    return @trains[@trains.index { |x| x == number}]
  end

  def message
    puts "Зарегистрирован поезд № #{@number}"
  end

  def each_van(&block)
    @list_vans.each do |van|
      block.call(van)
    end
    puts "--------------------------------"
    puts "Все объекты переданны успешно!!!"
  end

  private

  def speed_increase(speed) #чтобы только сам поезд мог увеличить свою скорость
    @speed += speed
  end

  def stop   #чтобы только сам поезд мог остановиться
    @speed = 0
  end

end
