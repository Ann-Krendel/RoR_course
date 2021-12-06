class Station

  attr_reader :trains, :name, :cargo_trains, :pass_trains
  def initialize(name)
    @name = name
    @cargo_trains = []
    @pass_trains = []
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

end
