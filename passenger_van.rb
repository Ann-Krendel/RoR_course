require "./modules.rb"
class PassengerVan
  
  include Producer

  attr_reader :number_pass_van, :type
  def initialize(number_pass_van, maker)
    type = "passenger"
    @number_pass_van = number_pass_van
    self.name_factory = maker

    is_valid, msg = valid?
    if is_valid == false
      raise StandardError.new(msg)
    end
    
    message
  end

  def valid?
    if @number_pass_van == "\n"
      return false, msg = "invalid number\n\n"
    end
    if self.name_factory == "\n"
      return false, msg = "invalid factory name\n\n"
    end
    return true
  end


  def message
    puts "Зарегистрирован пассажирский вагон № #{@number}"
  end
    
end