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
    is_valid, msg = valid?
    if is_valid == false
      raise StandardError.new(msg)
    end
  end

  def valid?
    if @route_name == ""
      return false, msg = "invalid name\n\n"
    end
    return true
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
