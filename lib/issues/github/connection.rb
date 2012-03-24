module Issues
  module Github
    class Connection
      include Singleton

      def connection
        @conn ||= Faraday.new(:url => "https://api.github.com")
        @conn.basic_auth(Github.username, Github.password) unless Github.password.nil?
        @conn
      end
    end
  end
end
