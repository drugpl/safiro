require 'singleton'

module Safiro
  class Aspect
    include Singleton
    attr_accessor :hooks

    def initialize
      @hooks = {}
    end

    def add_hook(klass)
      hooks[klass] = true
      set_trace_func(trace_proc)
    end

    private

    def trace_proc
      Proc.new do |event, file, line, id, binding, classname|
        if hooks[classname]
          case event.to_sym
            when :'c-call',   :call 
              classname.before_method(id, locals(binding))
            when :'c-return', :return 
              classname.after_method(id, locals(binding))
          end 
        end
      end
    end

    def locals(binding)
      locals = binding.eval("local_variables").inject({}) do |vars, name|
        vars[name] = binding.eval name.to_s
        vars
      end
    end
  end
end
