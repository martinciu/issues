require 'issues/command/options/options_parser'
require 'issues/command/options/config_parser'

module Issues
  module Command
    module Options

      class Parser
        def initialize(klass, args)
          self.klass, self.args = klass, args 
        end

        def parse
          parsers.inject(Group.new) { |group, parser| group.merge(parser.parse) }
        end

        private
        attr_accessor :klass, :args

        def options
          klass.options
        end

        def options_parser
          OptionsParser.new(options, args)
        end

        def config_parser(path)
          ConfigParser.new(options, path)
        end

        def parsers
          [config_parser("~/.issues"), config_parser(".issues"), options_parser] 
        end

      end

    end
  end
end
