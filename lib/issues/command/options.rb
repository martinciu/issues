require 'issues/command/options/option'
require 'issues/command/options/group'
require 'issues/command/options/parser'

module Issues
  module Command
    module Options

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def options
          @options ||= Group.new(global_options)
        end

        def option(name, *args)
          options << Option.new(name, args)
        end

        private
        def global_options
          Main.options unless self == Main
        end

      end

    end
  end
end
