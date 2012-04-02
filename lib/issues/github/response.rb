module Issues
  module Github
    class Response
      extend Forwardable
      def_delegators :@response, :headers
      
      def initialize(response)
        @response = response
      end

      def next_url
        links[:next]
      end

      def body
        JSON.parse @response.body
      end

      private
      def links
        link.split(',').inject({}) do |links, link|
          matches = /\<(.*?)\>; rel=\"(.*?)\"/.match(link.strip)
          links[matches[2].to_sym] = matches[1] if matches
          links
        end
      end

      def link
        headers.fetch("link") {""}
      end
    end
  end
end



