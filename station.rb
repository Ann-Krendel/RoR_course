require "./modules.rb"
class Station

  include InstanceCounter

  attr_reader :trains, :name, :cargo_trains, :pass_trains
  def initialize(name)
    @name = name
    @cargo_trains = []
    @pass_trains = []
    valid!
    message
    self.class.all << self
    register_instance
  end

  def valid!
    if valid? == false
      raise StandardError.new("invalid name\n\n")
    end
  end

  def valid?
    return @name != ""
  end

  def self.all
    @all ||= []
  end

  def add_train(train)
    if train.class == CargoTrain
      @cargo_trains << train
    end
    if train.class == PassengerTrain
      @pass_trains << train
    end
  end

  def count_trains_cargo
    @cargo_trains.size
  end

  def count_trains_pass
    @pass_trains.size
  end

  def depart_train(train)
    if train.class == CargoTrain
      @cargo_trains.delete(train)
    end
    if train.class == PassengerTrain
      @pass_trains.delete(train)
    end
  end

  def message
    puts "Станция с названием #{@name} успешно cоздана"
  end

end
