module Issues
  module Command
    module Hooks

      def self.included(base)
        base.extend ClassMethods
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
      def hooks
        self.class.hooks
      end

      def run_hooks
        hooks.each do |hook|
          send(hook)
        end
      end
 
    end
  end
end

