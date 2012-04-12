module Issues
  module Command
    module Options

      class OptionsParser
        def initialize(options, args)
          self.options, self.args = options, args
        end

        def parse
          parser.parse! 

          options
        end

        private
        attr_accessor :options, :args

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

 
