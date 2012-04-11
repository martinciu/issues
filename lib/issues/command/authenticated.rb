module Issues
  module Command
    module Authenticated

      def self.included(base)
        base.after_initialize :authenticate
      end

      private
      def authenticate
        Issues::Github.username = options.fetch(:username).value
        Issues::Github.password = options.fetch(:password).value
      end
    end
  end
end
