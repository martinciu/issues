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
          fetch_all.map { |attributes| new(attributes) }
        end

        def repo
          Issues.repo
        end

        protected
        def all_url
          "/repos/#{repo}/#{resources}?per_page=100"
        end

        def get(url)
          Issues::Github::Response.new Github.connection.get(url)
        end

        def fetch_all
          url = all_url
          resources = []
          begin
            response = get(url)
            resources += response.body
          end while url = response.next_url

          resources
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
