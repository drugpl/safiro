class Example
  include Safiro::Hooks

  def self.before_method(method, args)
  end

  def self.after_method(method, args)
  end

  def example(try = nil)
  end
end
