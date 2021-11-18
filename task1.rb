class Station

  attr_reader :list_trains
  def initialize(name)
    @name = name
    @list_trains = []
  end

  def new_train(train)
    @list_trains << train
    train.new_station(self)
  end

  def current_trains
    puts @list_trains
  end

  def list_trains_by_type(type)
    new_list = []
    for train in @list_trains
      if train.get_type() == type
        new_list << train
      end
    end
    return new_list
  end

  def count_trains_by_type(type)
    count = 0
    for train in @list_trains
      if train.get_type() == type
        count += 1
      end
    end
    return count
  end

  def depart_train(train)
    @list_trains.delete_if {|x| x==train}
  end

  def get_name
    @name
  end

end


class Train
  
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

  def get_size
    @size
  end

  def get_type
    @type
  end

  def size_increase
    if @speed == 0
      @size = @size + 1
    end
    return @size
  end
  
  def size_decrease
    if @speed == 0
      @size = @size - 1
    end
    return @size
  end

  def post_route(route)
    @route = route
    @station.depart_train(self)
    @station = route.get_first_station()
    @station.new_train(self)
  end

  def new_station(station)
    @station = station
  end

  def get_station
    return @station
  end

  def get_next_station
    list = @route.get_list_stations
    for i in (0...list.length-1) do
      if list[i] == @station
        return list[i+1]
      end
    end
    return false
  end

  def get_prev_station
    list = @route.get_list_stations
    for i in (1...list.length) do
      if list[i] == @station
        return list[i-1]
      end
    end
    return false
  end

  def go_forward
    list = @route.get_list_stations
    for i in (0...list.length-1) do
      if list[i] == @station
        @station.depart_train(self)
        list[i+1].new_train(self)
        break
      end
    end
  end

  def go_back
    list = @route.get_list_stations
    for i in (1...list.length) do
      if list[i] == @station
        @station.depart_train(self)
        @station = list[i-1]
        @station.new_train(self)
        break
      end
    end
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

  def get_first_station
    @first_station
  end

  def get_list_stations
    new_list = []
    new_list << @first_station
    for station in @list_stations
      new_list << station
    end
    new_list << @last_station
    return new_list
  end
  
  def delete_station(station)
    @list_stations.delete_if {|x| x==station}
  end

end