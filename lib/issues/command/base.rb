module Issues
  module Command
    module Base

      def initialize(args)
        self.options = Options::Parser.new(self.class, args).parse
        run_hooks
      end

      def run
        success
      end

      def self.included(base)
        base.send(:include, Options)
        base.extend ClassMethods
        Resolver.register base
      end

      module ClassMethods

        def after_initialize(message)
          hooks << message  
        end

        def hooks
          @hooks ||= [] 
        end

      end
 
      private
      attr_accessor :options
     
      def hooks
        self.class.hooks
      end

      def run_hooks
        hooks.each do |hook|
          send(hook)
        end
      end

      def success
        0
      end

    end
  end
end
