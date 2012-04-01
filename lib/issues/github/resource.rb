module Issues
  module Github
    module Resource

      def self.included(base)
        base.extend ClassMethods 
      end

      def repo
        self.class.repo
      end

      module ClassMethods
        def all
          JSON.parse(github.get(all_url).body).map { |attributes| new(attributes) }
        end

        def repo
          Issues.repo
        end

        def github
          Github.connection
        end

        protected
        def all_url
          "/repos/#{repo}/#{resources}"
        end
        
        def resource
          to_s.split("::").last.downcase
        end

        def resources
          "#{resource}s"
        end
      end

    end
  end
end
