require "./modules.rb"
class Route

  include InstanceCounter

  attr_reader :list_stations, :route_name
  def initialize(first_station, last_station, route_name)
    @route_name = route_name
    @first_station = first_station
    @last_station = last_station
    @list_stations = []
    valid!
    message
    register_instance
  end

  def valid!
    raise StandardError.new("invalid object\n\n") if !valid?
    true
  end

  def valid?
    if @route_name == ""
      return false
    end
    true
  end

  def add_station(station)
    @list_stations << station
  end

  def first_station
    @first_station
  end

  def list_stations
    [@first_station, @list_stations, @last_station].flatten
  end
  
  def delete_station(station)
    @list_stations.delete(station) {|x| x==station}
  end

  def message
    puts "Маршрут под названием #{@route_name} успешно cоздан"
  end

end
