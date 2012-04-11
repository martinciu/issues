require 'optparse'

require 'issues/command/options'
require 'issues/command/resolver'

require 'issues/command/base'
require 'issues/command/authenticated'
require 'issues/command/with_repo'

require 'issues/command/main'
require 'issues/command/help'
require 'issues/command/milestones'

module Issues
  module Command

    def self.run(args)
      Main.new(args).run
    end

  end
end
