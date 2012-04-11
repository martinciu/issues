require 'virtus'
require 'faraday'
require 'json'
require 'singleton'

require 'issues/command'
require 'issues/version'
require 'issues/github'
require 'issues/user'
require 'issues/repo'
require 'issues/milestone'
require 'issues/label'
require 'issues/issue'

module Issues
  
  class << self
    attr_accessor :repo
  end

end
