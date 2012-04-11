module Issues
  module Command

    module WithRepo

      def self.included(base)
        base.after_initialize :get_repo
      end

      private
      def get_repo
        Issues.repo = Issues::Repo.find(options.fetch(:repo).value)
      end
    end

  end
end
