module Issues
  module Commands
    class Help
      include Issues::Command::Base

      def run
        puts "help"

        success
      end
    end
  end
end
