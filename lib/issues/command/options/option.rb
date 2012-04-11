module Issues
  module Command
    module Options
      
      class Option
        attr_accessor :name, :args, :value
        def initialize(name, args)
          self.name, self.args = name, args
        end

        def name=(name)
          @name = name.to_s
        end
      end

    end
  end
end
