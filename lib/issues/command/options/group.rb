module Issues
  module Command
    module Options

      class Group
        extend Forwardable
        include Enumerable
        def_delegators :options, :each, :find, :<<

        def merge(other)
          other.each do |option|
            options << option unless include?(option)
          end

          self
        end

        def initialize(options = [])
          options ||= []
          options.each do |option|
            self << option
          end
        end

        def fetch(name)
          find { |option| option.name == name.to_s }
        end

        def <=>(ohter)
          name == other.name.to_s
        end

        private
        def options
          @options ||= []
        end
      end

    end
  end
end
