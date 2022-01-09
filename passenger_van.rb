require "./modules.rb"
require "./van.rb"
class PassengerVan < Van
  
  include Producer

  attr_reader :type
  def initialize(maker, count_seats)
    @type = :passenger
    self.name_factory = maker
    @count_seats = count_seats
    @seats = []
    creation_seats(count_seats)
    valid!
    message
  end

  def valid!
    raise StandardError.new("invalid number\n\n") if @count_seats <= 0
    raise StandardError.new("invalid factory\n\n") if self.name_factory == ""
    true
  end

  def valid?
    if self.name_factory == "" || @count_seats <= 0
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
    puts "Зарегистрирован пассажирский вагон"
  end

  private

  def creation_seats(count_seats)
    count_seats.times { |number| @seats[number] = nil }
  end
    
end