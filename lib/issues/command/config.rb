module Issues
  module Command
    module Config

      def self.included(base)
        base.extend ClassMethods
        base.send(:include, Hooks)
        base.send(:alias_method, :initialize_without_config, :initialize)
        base.send(:alias_method, :initialize, :initialize_with_config)
        base.after_initialize :parse_config
      end

      private

    end
  end
end


