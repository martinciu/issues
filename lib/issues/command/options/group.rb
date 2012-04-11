module Issues
  module Command
    module Options

      class Group
        extend Forwardable
        def_delegators :options, :each, :find, :<<

        def initialize(options = [])
          options ||= []
          options.each do |option|
            self << option
          end
        end

        def fetch(name)
          find { |option| option.name == name.to_s }
        end

        private
        def options
          @options ||= []
        end
      end

    end
  end
end
