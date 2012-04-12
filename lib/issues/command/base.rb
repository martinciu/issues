module Issues
  module Command
    module Base

      def initialize(args)
        self.args = args
        run_hooks
      end

      def run
        success
      end

      def self.included(base)
        base.send(:include, Options)
        Resolver.register base
      end

      private
      attr_accessor :args 
      def success
        0
      end

    end
  end
end
