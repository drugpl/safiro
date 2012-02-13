require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Safiro::Hooks do
  subject { Example.new }  

  it "should execute before_method" do
    Example.should_receive(:before_method)
    subject.example
  end

  it "should execute after_method" do
    Example.should_receive(:after_method)
    subject.example
  end

  [:before, :after].each do |method_type|
    it "should execute #{method_type}_method with local variables" do
      Example.should_receive(:"#{method_type}_method").with(:example, {:try => nil})
      subject.example
    end

    it "should execute #{method_type}_method with local variables" do
      Example.should_receive(:"#{method_type}_method").with(:example, {:try => "string"})
      subject.example("string")
    end
  end

  it "should change local variables" do
    Example.should_receive(:before_method).with(:example!, {:try => nil})
    Example.should_receive(:after_method).with(:example!, {:try => true})
    subject.example!
  end
end

