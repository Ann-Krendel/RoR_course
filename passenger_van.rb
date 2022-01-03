require "./modules.rb"
class PassengerVan
  
  include Producer

  attr_reader :number_pass_van, :type, :taken_seats, :seats
  def initialize(number_pass_van, maker, seats)
    type = "passenger"
    @number_pass_van = number_pass_van
    @seats = seats
    @taken_seats = 0
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

  def taken_seat
    @seats -= 1
    @taken_seats += 1
  end

  def message
    puts "Зарегистрирован пассажирский вагон № #{@number_pass_van}"
  end
    
end