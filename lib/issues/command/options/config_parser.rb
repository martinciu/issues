module Issues
  module Command
    module Options

      class ConfigParser
        def initialize(options, path)
          self.options, self.path = options, path
        end

        def parse
          options
        end

        private
        attr_accessor :options, :path
      end

    end
  end
end

 
