require "./modules.rb"
class PassengerVan
  
  include Producer

  attr_reader :number_pass_van, :type
  def initialize(number_pass_van, maker)
    type = "passenger"
    @number_pass_van = number_pass_van
    self.name_factory = maker
  end
    
end