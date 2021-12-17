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
    raise StandardError.new("invalid number\n\n") if @number_pass_van == 0
    raise StandardError.new("invalid factory\n\n") if self.name_factory == ""
    true
  end

  def valid?
    if self.name_factory == "" || @number_pass_van == 0
      return false
    end
    true
  end

  def message
    puts "Зарегистрирован пассажирский вагон № #{@number_pass_van}"
  end
    
end