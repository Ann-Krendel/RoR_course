require "./modules.rb"
require "./van.rb"
class CargoVan < Van
  
  include Producer

  attr_reader :type, :free_volume
  def initialize(maker, volume)
    @type = :cargo
    self.name_factory = maker
    @total_volume = volume
    @free_volume = volume
    valid!
    message
  end

  def valid!
    raise StandardError.new("invalid number\n\n") if @total_volume == 0
    raise StandardError.new("invalid factory\n\n") if self.name_factory == ""
    true
  end

  def valid?
    if self.name_factory == "" || @total_volume == 0
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
    puts "Зарегистрирован грузовой вагон"
  end
  
end