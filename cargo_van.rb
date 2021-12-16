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
    is_valid, msg = valid?
    if is_valid == false
      raise StandardError.new(msg)
    end
  end

  def valid?
    if @number_cargo_van == 0
      return false, msg = "invalid number\n\n"
    end
    if self.name_factory == ""
      return false, msg = "invalid factory name\n\n"
    end
    return true
  end

  def message
    puts "Зарегистрирован грузовой вагон № #{@number_cargo_van}"
  end
  
end