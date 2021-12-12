module Producer 

  def made_by(name)
    @name_factory = name
  end

  def producer
    @name_factory
  end 

end

module InstanceCounter

  @@instances=0

  def self.instances
    @@instances
  end

  protected

  def register_instance
    @@instances += 1
  end

end