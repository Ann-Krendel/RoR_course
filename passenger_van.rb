require "./models.rb"
class PassengerVan
  
  include Producer
  extend InstanceCounter

  attr_reader :number_pass_van, :type
  def initialize(number_pass_van)
    type = "passenger"
    @number_pass_van = number_pass_van
    @@instances = 0
    self.register_instance
  end
    
end