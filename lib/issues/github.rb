require 'issues/github/connection'
require 'issues/github/resource'

module Issues
  module Github
    extend self
    attr_accessor :username, :password

    def connection
      Github::Connection.instance.connection
    end
  end
end
