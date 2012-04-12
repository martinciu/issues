module Issues
  module Command
    class Resolver

      def initialize(args)
        @args = args
      end

      def command
        command_class.new(@args) 
      end

      def self.register(command)
        commands[command.to_s] = command
      end

      private
      def self.commands
        @commands ||= {}
      end

      def commands
        self.class.commands
      end

      def command_class
        commands.fetch(command_name) { default_command }
      end

      def command_name
        namespaced classify(@args.shift)
      end

      def default_command
        commands[default_command_name]
      end

      def default_command_name
        namespaced "Help"
      end

      def classify(string)
        string = string.to_s.dup
        string[0] = string[0,1].upcase

        string
      end

      def namespaced(class_name)
        "Issues::Commands::#{class_name}"
      end

    end
  end
end
