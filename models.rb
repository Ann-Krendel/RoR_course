module Producer 

  def made_by
    puts "Введите название компании - производителя: "
    @name_factory = gets.to_s
  end

  def producer
    puts "Компаниия - производитель: " + @name_factory.to_s
  end 

end

module InstanceCounter

  @@instances=0

  def self.instances
    @@instances
  end

  protected

  def self.register_instance
    @@instances+=1
  end

end