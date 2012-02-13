module Safiro
  module Hooks
    extend Safiro::Methods

    def self.included(base)
      base.extend(ClassMethods)
      safiro(:hook, base)
    end

    module ClassMethods
      def before_method(method, args)
        raise NoImplementError
      end

      def after_method(method, args)
        raise ::NoImplementError
      end
    end
  end
end
