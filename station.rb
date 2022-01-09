require "./modules.rb"
class Station

  include InstanceCounter

  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @trains = []
    valid!
    message
    self.class.all << self
    register_instance
  end

  def valid!
    raise StandardError.new("invalid name\n\n") if @name == ""
    true
  end

  def valid?
    if @name == ""
      return false
    end
    true
  end

  def self.all
    @all ||= []
  end

  def add_train(train)
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def each_train(&block)
    @trains.each do |train|
      block.call(train)
    end
  end

  def trains_info
    raise 'No block given' unless block_given?

    @trains.each { |train| yield(train) }
  end

  def trains_by_type(type)
    trains_by_type = []
    freight_count = 0
    coach_count = 0
    @trains.each do |train|
      trains_by_type << train if train.type == type
      freight_count += 1 if train.type == :cargo
      coach_count += 1 if train.type == :passenger
    end
    { trains_by_type: trains_by_type, freight_count: freight_count, coach_count: coach_count }
  end

  def message
    puts "Станция с названием #{@name} успешно cоздана"
  end

end
