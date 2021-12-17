module Producer 

  attr_accessor :name_factory

end

module InstanceCounter

  def self.included(base)
    base.send :include, InstanceMethod
    base.extend ClassMethod
  end

  module ClassMethod

    attr_accessor :instances

  end

  module InstanceMethod

    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end

  end

end
