require "./modules.rb"
class PassengerVan
  
  include Producer

  attr_reader :number_pass_van, :type
  def initialize(number_pass_van, maker)
    type = "passenger"
    @number_pass_van = number_pass_van
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
    if @number_pass_van = 0
      return false, msg = "invalid number\n\n"
    end
    if self.name_factory == ""
      return false, msg = "invalid factory name\n\n"
    end
    return true
  end

  def message
    puts "Зарегистрирован пассажирский вагон № #{@number_pass_van}"
  end
    
end