require 'issues/command/options/option'
require 'issues/command/options/group'
require 'issues/command/options/parser'

module Issues
  module Command
    module Options

      def self.included(base)
        base.extend ClassMethods
        base.send(:include, Hooks)
        base.send(:alias_method, :initialize_without_options, :initialize)
        base.send(:alias_method, :initialize, :initialize_with_options)
        base.after_initialize :parse_options
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

      private
      attr_accessor :options, :args

      def parse_options
        self.options = Options::Parser.new(self.class, args).parse
      end

      def initialize_with_options(args)
        self.args = args
        initialize_without_options(args)
      end

    end
  end
end
