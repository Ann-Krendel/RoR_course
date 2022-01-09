require "./modules.rb"
require "./accessor.rb"
require "./validation.rb"
class Train

  include Producer
  include InstanceCounter
  include Accessors
  include Validation
  
  attr_reader :station, :number, :vans
  strong_attr_accessor :atr_name, String
  NUMBER_FORMAT = /^([a-zA-Z]|\d){3}-*([a-zA-Z]|\d){2}$/.freeze

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :number, :type, String

  @all_trains = []

  def initialize(number, maker)
    @number = number
    @speed = 0
    @vans=[]
    self.name_factory = maker
    validate!
    register_instance
    Train.all_trains << self
    message
  end

  def valid!
    raise StandardError.new("invalid number\n\n") if @number !~ NUMBER_FORMAT
    raise StandardError.new("invalid factory\n\n") if self.name_factory == ""
    true
  end

  def valid?
    if @number !~ NUMBER_FORMAT || self.name_factory == ""
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
    @vans = [] if @vans.class == NilClass
    @vans << van if van.type == @type &&  @speed == 0
  end

  def del_van(van)
    @vans.delete(van) if @speed == 0
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
    @vans.each do |van|
      block.call(van)
    end
    puts "--------------------------------"
    puts "Все объекты переданны успешно!!!"
  end

  def validate_number!(number)
    raise 'Не правильный формат номера' if number !~ NUMBER_FORMAT
  end

  protected

  class << self
    attr_accessor :all_trains
  end

  attr_accessor_with_history :station

  private

  def speed_increase(speed) #чтобы только сам поезд мог увеличить свою скорость
    @speed += speed
  end

  def stop   #чтобы только сам поезд мог остановиться
    @speed = 0
  end

end
