require "./modules.rb"
class CargoVan
  
  include Producer

  attr_reader :number_cargo_van, :type, :volume, :taken_volume
  def initialize(number_cargo_van, maker, volume)
    type = "cargo"
    @number_cargo_van = number_cargo_van
    @volume = volume
    @taken_volume = 0
    self.name_factory = maker
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

  def taken_volume
    @volume -= 1
    @taken_volume += 1
  end

  def message
    puts "Зарегистрирован грузовой вагон № #{@number_cargo_van}"
  end
  
end