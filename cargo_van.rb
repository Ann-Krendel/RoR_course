require "./modules.rb"
class CargoVan
  
  include Producer

  attr_reader :number_cargo_van, :type
  def initialize(number_cargo_van, maker)
    type = "cargo"
    @number_cargo_van = number_cargo_van
    self.name_factory = maker

    is_valid, msg = valid?
    if is_valid == false
      raise StandardError.new(msg)
    end
    
    message
  end

  def valid?
    if @number_cargo_van == "\n"
      return false, msg = "invalid number\n\n"
    end
    if self.name_factory == "\n"
      return false, msg = "invalid factory name\n\n"
    end
    return true
  end

  def message
    puts "Зарегистрирован грузовой вагон № #{@number}"
  end
  
end