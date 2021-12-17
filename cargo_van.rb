require "./modules.rb"
class CargoVan
  
  include Producer

  attr_reader :number_cargo_van, :type
  def initialize(number_cargo_van, maker)
    type = "cargo"
    @number_cargo_van = number_cargo_van
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

  def message
    puts "Зарегистрирован грузовой вагон № #{@number_cargo_van}"
  end
  
end