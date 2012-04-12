module Issues
  module Command
    module Base

      def run
        success
      end

      def self.included(base)
        base.send(:include, Options)
        Resolver.register base
      end

      private
      def success
        0
      end

    end
  end
end
