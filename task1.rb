class Station

  attr_reader :trains
  attr_reader :name
  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select{|train| train.type == type}
  end

  def count_trains_by_type(type)
    self.trains_by_type(type).size
  end

  def depart_train(train)
    @trains.delete(train)
  end

end


class Train
  
  attr_reader :size
  attr_reader :station
  attr_reader :type
  def initialize(number, type, size)
    @number = number
    @type = type
    @size = size
    @speed = 0
  end

  def get_speed
    @speed
  end

  def speed_increase(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def size_increase
    @size += 1 if @speed == 0
  end
  
  def size_decrease
    @size -= 1 if @speed == 0
    return @size
  end

  def add_route(route)
    @route = route
    @station.depart_train(self) if @station != nil
    @station = route.first_station()
    @station.add_train(self)
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

end


class Route

  attr_reader :list_stations
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @list_stations = []
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
    @list_stations.delete {|x| x==station}
  end

end