module Safiro
  module Methods
    def safiro(*args, &block)
      case args.first
        when :hook
          Safiro::Aspect.instance.tap do |aspect|
            aspect.add_hook(args.last)
          end
      end
    end
  end
end
