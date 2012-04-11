module Issues
  module Command

    class Milestones
      include Issues::Command::Base
      include Issues::Command::Authenticated
      include Issues::Command::WithRepo

      def run
        Issues::Milestone.all.each do |milestone|
          p milestone
        end

        success
      end
    end
  end

end
