module Issues
  module Command
    module Hooks

      def self.included(base)
        base.extend ClassMethods
        base.send(:alias_method, :initialize_without_hooks, :initialize)
        base.send(:alias_method, :initialize, :initialize_with_hooks)
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

      def initialize_with_hooks(args)
        initialize_without_hooks
        run_hooks
      end
 
    end
  end
end

