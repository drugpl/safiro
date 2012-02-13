require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Example
  include Safiro::Hooks

  def self.before_method(method)
    puts method
  end

  def self.after_method(method)
    puts method
  end

  def my_method
    puts "hello"
  end
end

describe "Safiro" do
  it "should do sometings" do
    Example.new.my_method
  end
end
