module Issues
  module Command
    module Options

      class Parser
        def initialize(klass, args)
          self.klass, self.args = klass, args 
        end

        def parse
          parser.parse!(args)

          options
        end

        private
        attr_accessor :klass, :args
        def options
          klass.options
        end

        def parser
          OptionParser.new do |parser|
            options.each do |option|
              parser.on(*option.args) do |value|
                option.value = value
              end
            end
          end
        end

      end

    end
  end
end
