require "./modules.rb"
class CargoVan
  
  include Producer

  attr_reader :number_cargo_van, :type, :free_volume
  def initialize(number_cargo_van, maker, volume)
    type = "cargo"
    @number_cargo_van = number_cargo_van
    self.name_factory = maker
    @total_volume = volume
    @free_volume = volume
    valid!
    message
  end

  def valid!
    raise StandardError.new("invalid number\n\n") if @number_cargo_van == 0
    raise StandardError.new("invalid factory\n\n") if self.name_factory == ""
    true
  end

  def valid?
    if self.name_factory == "" || @number_cargo_van == 0
      return false
    end
    true
  end

  def take_volume(volume)
    raise "Превышен свободный объем: #{@free_volume}" if (@free_volume - volume).negative?

    @free_volume -= volume
  end

  def occupied_volume
    @total_volume - @free_volume
  end

  def message
    puts "Зарегистрирован грузовой вагон № #{@number_cargo_van}"
  end
  
end