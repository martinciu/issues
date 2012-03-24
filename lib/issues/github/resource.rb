module Issues
  module Github
    module Resource
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def github
          Github.connection
        end
      end

    end
  end
end
