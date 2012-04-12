module Issues
  module Command

    class Main
      include Options

      option :repo, '--repo owner/repo', '-r'
      option :username, '--username login', '-u'
      option :password, '--password password', '-p'

      def run
        Resolver.new(args).command.run
      end

    end

  end
end
     
