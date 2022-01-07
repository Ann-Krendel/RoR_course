require "./modules.rb"
class PassengerVan
  
  include Producer

  attr_reader :number_pass_van, :type
  def initialize(number_pass_van, maker, count_seats)
    type = "passenger"
    @number_pass_van = number_pass_van
    self.name_factory = maker
    @seats = []
    creation_seats(count_seats)
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

  def take_seat
    @empty_seat = @seats.key(nil)
    raise 'В вагоне закончились свободные места' if @empty_seat.nil?

    @seats[@empty_seat] = 'occupied'
  end

  def occupied_seats
    @seats.values.count { |value| value == 'occupied' }
  end

  def free_seats
    @seats.values.count(&:nil?)
  end

  def message
    puts "Зарегистрирован пассажирский вагон № #{@number_pass_van}"
  end

  private

  def creation_seats(count_seats)
    count_seats.times { |number| @seats[number] = nil }
  end
    
end