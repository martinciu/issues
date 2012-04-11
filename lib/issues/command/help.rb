module Issues
  module Command
    class Help
      include Issues::Command::Base

      def run
        puts "help"

        success
      end
    end
  end
end
