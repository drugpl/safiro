require 'singleton'

module Safiro
  class Aspect
    include Singleton
    attr_accessor :hooks

    def initialize
      @hooks = []
    end

    def add_hook(klass)
      hooks << klass
      set_trace_func(trace_proc)
    end

    private

    def trace_proc
      Proc.new do |event, file, line, id, binding, classname|
        if hooks.include?(classname)
          case event.to_sym
            when :'c-call', :call
              classname.before_method(id)
            when :'c-return', :return
              classname.after_method(id)
          end 
        end
      end
    end
  end
end
